using ImperiyaD.models;
using ImperiyaD.windows;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ImperiyaD.pages
{
    /// <summary>
    /// Логика взаимодействия для merches.xaml
    /// </summary>
    public partial class merches : Page
    {
        private ObservableCollection<OrderItem> orderItems = new ObservableCollection<OrderItem>();
        private ObservableCollection<merch> merchCollection;
        private List<merch> filteredMerchCollection;
        private int _currentPage = 1;
        private int _countInPage = 2;
        public merches(users user)
        {
            DataContext = user;
            InitializeComponent();
            merchCollection = new ObservableCollection<merch>(imp.GetContext().merch.ToList());
            filteredMerchCollection = merchCollection.ToList();
            LoadBrands(); // Загружаем бренды в ComboBox
            UpdateMerchCollection();
        }

        private void LoadBrands()
        {
            using (var context = new imp())
            {
                var brands = context.brand.ToList();
                brands.Insert(0, new brand { id = 0, brand_name = "Все бренды" }); // Добавляем элемент для всех брендов
                BrendComboBox.ItemsSource = brands;
                BrendComboBox.SelectedIndex = 0; // Выбираем элемент для всех брендов по умолчанию
            }
        }

        private void BrendComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (BrendComboBox.SelectedItem is brand selectedBrand)
            {
                _currentPage = 1; // Сбрасываем текущую страницу при выборе нового бренда
                FilterMerchCollection();
            }
        }
        private void FilterMerchCollection()
        {
            if (BrendComboBox.SelectedItem is brand selectedBrand)
            {
                if (selectedBrand.id == 0)
                {
                    // Если выбран элемент для всех брендов
                    filteredMerchCollection = merchCollection.ToList();
                }
                else
                {
                    // Фильтрация по выбранному бренду
                    filteredMerchCollection = merchCollection.Where(m => m.id_brend == selectedBrand.id).ToList();
                }

                // Дополнительно фильтруем по названию, если текст поиска не пуст
                string searchTerm = SearchTextBox.Text.ToLower();
                if (!string.IsNullOrWhiteSpace(searchTerm))
                {
                    filteredMerchCollection = filteredMerchCollection.Where(m => m.name.ToLower().Contains(searchTerm)).ToList();
                }

                UpdateMerchCollection();
            }
        }

        private void SearchByBrand(int brandId)
        {
            var filteredMerch = merchCollection.Where(m => m.id_brend == brandId).ToList();
            MerchBD.ItemsSource = filteredMerch;
        }

        private void UpdateMerchCollection()
        {
            int startIndex = (_currentPage - 1) * _countInPage;
            var itemsForPage = filteredMerchCollection.Skip(startIndex).Take(_countInPage).ToList();
            MerchBD.ItemsSource = itemsForPage;

            // Обновляем видимость кнопок пагинации
            UpdatePaginationButtonsVisibility();
        }
        private void UpdatePaginationButtonsVisibility()
        {
            int totalItems = filteredMerchCollection.Count;
            int totalPages = (int)Math.Ceiling((double)totalItems / _countInPage);

            PreviousPageButton.Visibility = (_currentPage > 1) ? Visibility.Visible : Visibility.Collapsed;
            NextPageButton.Visibility = (_currentPage < totalPages) ? Visibility.Visible : Visibility.Collapsed;
        }
        private void SearchByName(string searchTerm)
        {
            if (string.IsNullOrWhiteSpace(searchTerm))
            {
                // Если строка поиска пустая или содержит только пробелы, показываем все товары
                UpdateMerchCollection();
            }
            else
            {
                // Приводим к нижнему регистру для регистронезависимого поиска
                string searchTermLower = searchTerm.ToLower();
                // Фильтруем товары по имени, содержащему введенную строку
                var filteredMerch = merchCollection.Where(m => m.name.ToLower().Contains(searchTermLower)).ToList();
                MerchBD.ItemsSource = filteredMerch;
            }
        }

        private void PreviousPageButton_Click(object sender, RoutedEventArgs e)
        {
            if (_currentPage > 1)
            {
                _currentPage--;
                UpdateMerchCollection();
            }
        }

        private void NextPageButton_Click(object sender, RoutedEventArgs e)
        {
            int totalItems = filteredMerchCollection.Count;
            int totalPages = (int)Math.Ceiling((double)totalItems / _countInPage);

            if (_currentPage < totalPages)
            {
                _currentPage++;
                UpdateMerchCollection();
            }
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            _currentPage = 1; // Сбрасываем текущую страницу при новом поиске
            FilterMerchCollection();
        }

        private void AddToOrder_Click(object sender, RoutedEventArgs e)
        {
            if (MerchBD.SelectedItem != null)
            {
                merch selectedMerch = MerchBD.SelectedItem as merch;

                OrderItem orderItem = new OrderItem
                {
                    MerchId = selectedMerch.id,
                    MerchName = selectedMerch.name,
                    MerchPrice = selectedMerch.price,
                    Quantity = 1,
                    PointCollection = new ObservableCollection<point>()
                };

                if (selectedMerch.discount.HasValue)
                {
                    orderItem.Discount = selectedMerch.discount.Value;
                }
                else
                {
                    MessageBox.Show("У товара нет скидки");
                }

                orderItems.Add(orderItem);
                UpdateOrderViewButtonVisibility();
            }
        }

        private void UpdateOrderViewButtonVisibility()
        {
            if (orderItems.Any())
            {
                ShowOrderButton.Visibility = Visibility.Visible;
            }
            else
            {
                ShowOrderButton.Visibility = Visibility.Collapsed;
            }
        }

        private void ShowOrderButton_Click(object sender, RoutedEventArgs e)
        {
            OneOrder orderViewWindow = new OneOrder(orderItems);
            orderViewWindow.ShowDialog();
        }

        public class OrderItem
        {
            public int OrderId { get; set; }
            public int UserId { get; set; }
            public int StatusId { get; set; }
            public int PointId { get; set; }
            public DateTime OrderDate { get; set; }
            public int Code { get; set; }
            public int Cost { get; set; }
            public int Discount { get; set; }
            public int MerchId { get; set; }
            public string MerchName { get; set; }
            public decimal MerchPrice { get; set; }
            public int Quantity { get; set; }
            public ObservableCollection<point> PointCollection { get; set; }
            public point SelectedPoint { get; set; }
        }
    }
}

