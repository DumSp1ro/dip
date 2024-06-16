using ImperiyaD.models;
using ImperiyaD.windows;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Printing;
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
    /// Логика взаимодействия для OrdersPage.xaml
    /// </summary>
    public partial class OrdersPage : Page
    {
        private ObservableCollection<orders> ordersCollection;
        public OrdersPage()
        {
            InitializeComponent();
            RefreshOrders();
            ClientTextBox.TextChanged += ClientTextBox_TextChanged;
            StatusTextBox.TextChanged += StatusTextBox_TextChanged;
        }
        private void RefreshOrders()
        {
            ordersCollection = new ObservableCollection<orders>(imp.GetContext().orders.ToList());
            dataGrid.ItemsSource = ordersCollection;
        }
        private void EditOrder(object sender, RoutedEventArgs e)
        {
            orders selectedOrder = ((FrameworkElement)sender).DataContext as orders;
            EditOWindow editOWindow = new EditOWindow(selectedOrder);
            editOWindow.WindowClosed += EditOWindow_WindowClosed;
            editOWindow.ShowDialog();
        }

        private void EditOWindow_WindowClosed(object sender, EventArgs e)
        {
            RefreshOrders();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                PrintDialog dialog = new PrintDialog();

                if (dialog.ShowDialog() != true)
                    return;

                dialog.PrintTicket.PageMediaSize = new PageMediaSize(PageMediaSizeName.ISOA4);
                dialog.PrintTicket.PageOrientation = PageOrientation.Landscape;
                dialog.PrintVisual(dataGrid, "Печать отчета");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Печать отчета", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Ref(object sender, RoutedEventArgs e)
        {
            RefreshOrders();
        }

        private void ClientTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            FilterOrders();
        }

        private void StatusTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            FilterOrders();
        }

        private void FilterOrders()
        {
            // Получаем текст из текстовых полей
            string clientFilter = ClientTextBox.Text;
            string statusFilter = StatusTextBox.Text;

            // Применяем фильтрацию
            var filteredOrders = imp.GetContext().orders.ToList();

            if (!string.IsNullOrEmpty(clientFilter))
            {
                filteredOrders = filteredOrders.Where(order => order.users.name.Contains(clientFilter)).ToList();
            }

            if (!string.IsNullOrEmpty(statusFilter))
            {
                filteredOrders = filteredOrders.Where(order => order.status.status_name.Contains(statusFilter)).ToList();
            }

            // Обновляем источник данных DataGrid
            ordersCollection.Clear();
            foreach (var order in filteredOrders)
            {
                ordersCollection.Add(order);
            }
        }

        private void perenos(object sender, RoutedEventArgs e)
        {
            try
            {
                using (var context = new imp())
                {
                    // Получаем выбранную строку из DataGrid
                    var selectedOrder = dataGrid.SelectedItem as orders;
                    // Если строка была выбрана
                    if (selectedOrder != null)
                    {
                        // Создаем новый объект Orders_RIO и копируем данные из selectedOrder
                        var newOrderRIO = new Orders_RIO
                        {
                            id_users = selectedOrder.id_users,
                            id_status = 1, // Новый статус для таблицы Orders_RIO
                            id_point = selectedOrder.id_point,
                            order_date = selectedOrder.order_date,
                            code = selectedOrder.code,
                            cost = selectedOrder.cost,
                            discount = (int)selectedOrder.discount,
                            total_cost = (int)selectedOrder.total_cost,
                            delivery_days = (int)selectedOrder.delivery_days
                            // Продолжайте так для всех полей
                        };
                        // Добавляем новую строку в таблицу Orders_RIO
                        context.Orders_RIO.Add(newOrderRIO);
                        context.SaveChanges();

                        // Обновляем статус выбранного заказа в базе данных
                        var orderInDb = context.orders.Find(selectedOrder.id);
                        if (orderInDb != null)
                        {
                            orderInDb.id_status = 3; // Изменение статуса на "Завершен"
                            context.SaveChanges(); // Сохранение изменений в базе данных
                        }

                        // Получаем обновленные данные из базы данных
                        var updatedOrders = context.orders.ToList();

                        // Обновляем ordersCollection с полученными обновленными данными
                        ordersCollection.Clear();
                        foreach (var order in updatedOrders)
                        {
                            ordersCollection.Add(order);
                        }

                        // Обновляем DataGrid, чтобы он отобразил актуальные данные
                        dataGrid.Items.Refresh();

                        // Оповещаем пользователя об успешном переносе
                        MessageBox.Show("Заказ успешно перемещен.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    else
                    {
                        // Если строка не была выбрана, оповещаем пользователя
                        MessageBox.Show("Пожалуйста, выберите строку для переноса.", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Произошла ошибка при переносе строки: " + ex.Message +
        "\n\nТип исключения: " + ex.GetType().FullName +
        "\n\nСтек вызовов: " + ex.StackTrace,
        "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
