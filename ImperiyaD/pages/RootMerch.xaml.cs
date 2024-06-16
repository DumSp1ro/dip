using ImperiyaD.classes;
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
    /// Логика взаимодействия для RootMerch.xaml
    /// </summary>
    public partial class RootMerch : Page
    {
        private ObservableCollection<merch> merchCollection;
        public RootMerch(users user)
        {
            InitializeComponent();
            DataContext = user;
            merchCollection = new ObservableCollection<merch>(imp.GetContext().merch.ToList());
            MerchBD.ItemsSource = merchCollection;
            SearchTextBox.TextChanged += SearchTextBox_TextChanged;
            BrendComboBox.SelectionChanged += BrendComboBox_SelectionChanged;
            CheckUserRole();
            LoadBrands(); // Загружаем бренды в ComboBox
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
            if (BrendComboBox.SelectedItem is brand selectedBrand && selectedBrand.id != 0)
            {
                SearchByBrand(selectedBrand.id);
            }
            else
            {
                RefreshPage(); // Сбрасываем фильтрацию, показываем все товары
            }
        }
        private void SearchByBrand(int brandId)
        {
            var filteredMerch = merchCollection.Where(m => m.id_brend == brandId).ToList();
            MerchBD.ItemsSource = filteredMerch;
        }
        private void CheckUserRole()
        {
            // Проверка текущего пользователя
            var currentUser = imp.CurrentUser;

            if (currentUser != null && currentUser.id_type == 2) // Если пользователь кассир
            {
                // Скрыть ненужные элементы для кассира
                AddButton.Visibility = Visibility.Collapsed;
                OrdersButton.Visibility = Visibility.Collapsed;
                HistoryButton.Visibility = Visibility.Collapsed;
                NameSort.Visibility = Visibility.Visible;
                SortMan.Visibility = Visibility.Visible;

                // Скрыть колонку редактирования
                MerchBD.Columns.Remove(EditColumn);
            }
        }
        private void Add(object sender, RoutedEventArgs e)
        {
            EditMWindow emw = new EditMWindow(null);
            emw.WindowClosed += EditMWindow_WindowClosed; // Подписываемся на событие WindowClosed
            emw.ShowDialog();
        }
        private void Edit(object sender, RoutedEventArgs e)
        {
            // Получаем выбранный элемент из DataGrid
            merch selectedMerch = (sender as Button).DataContext as merch;

            // Открываем окно EditMWindow для редактирования выбранного элемента
            EditMWindow emw = new EditMWindow(selectedMerch);
            emw.WindowClosed += EditMWindow_WindowClosed; // Подписываемся на событие WindowClosed
            emw.ShowDialog();
        }
        private void Delete(object sender, RoutedEventArgs e)
        {
            var MerchDell = MerchBD.SelectedItems.Cast<merch>().ToList();
            if (MessageBox.Show($"Вы точно хотите списать данную позицию?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    imp.GetContext().merch.RemoveRange(MerchDell);
                    imp.GetContext().SaveChanges();
                    MessageBox.Show("Товар списан!");

                    // Обновление ObservableCollection, что автоматически обновит DataGrid
                    foreach (var merch in MerchDell)
                    {
                        merchCollection.Remove(merch);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Произошла ошибка: {ex.Message}\n\nStackTrace: {ex.StackTrace}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
        private void Orders(object sender, RoutedEventArgs e)
        {
            manager.MainFrame.Navigate(new OrdersPage());
        }
        
        private void RefreshPage()
        {
            merchCollection.Clear();
            var filteredMerch = imp.GetContext().merch.ToList();

            // Фильтрация поиском по названию
            if (!string.IsNullOrEmpty(SearchTextBox.Text))
            {
                filteredMerch = filteredMerch.Where(m => m.name.Contains(SearchTextBox.Text)).ToList();
            }

            foreach (var merch in filteredMerch)
            {
                merchCollection.Add(merch);
            }

            // Если выбран бренд в ComboBox, фильтруем по бренду
            if (BrendComboBox.SelectedItem is brand selectedBrand && selectedBrand.id != 0)
            {
                var brandFilteredMerch = merchCollection.Where(m => m.id_brend == selectedBrand.id).ToList();
                MerchBD.ItemsSource = brandFilteredMerch;
            }
            else
            {
                MerchBD.ItemsSource = merchCollection;
            }
        }
        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            RefreshPage();
        }
        private void BrendTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            RefreshPage();
        }
        private void Ref(object sender, RoutedEventArgs e)
        {
            RefreshPage();
        }
        private void History(object sender, RoutedEventArgs e)
        {
            manager.MainFrame.Navigate(new HistoryPage());
        }
        private void Pods(object sender, RoutedEventArgs e)
        {
            PodskWindow podsk = new PodskWindow();
            podsk.ShowDialog();
        }
        private void EditMWindow_WindowClosed(object sender, EventArgs e)
        {
            // Выполняем обновление данных или перезагрузку страницы RootMerch
            RefreshPage();
        }
    }
}
