using ImperiyaD.models;
using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;

namespace ImperiyaD.windows
{
    /// <summary>
    /// Логика взаимодействия для EditOWindow.xaml
    /// </summary>
    public partial class EditOWindow : Window
    {
        private orders currentOrder;
        public event EventHandler WindowClosed;
        public EditOWindow(orders selectedOrder)
        {
            InitializeComponent();
            currentOrder = selectedOrder != null ? imp.GetContext().orders.Find(selectedOrder.id) : new orders();
            DataContext = currentOrder;
            StatusComboBoxItemsSource();
            pointComboBoxItemsSource();
        }
        private void StatusComboBoxItemsSource()
        {
            statusComboBox.ItemsSource = new string[]
            {
                "Новый",
                "Отменен",
                "Завершен"
            };
        }
        private void pointComboBoxItemsSource()
        {
            pointComboBox.ItemsSource = new string[]
            {
                "ЦДМ",
                "ТРЦ ЕВРОПЕЙСКИЙ",
                "ТРЦ РИО",
                "ТРЦ \"Океания\" 3 этаж",
                "Outlet Village Белая Дача",
                "ТЦ \"АЭРОБУС\"",
                "Vnukovo Premium Outlet",
                "ТРК \"ВЕГАС\"",
            };
        }
        private int GetStatusID(string status)
        {
            switch (status)
            {
                case "Новый":
                    return 1;
                case "Отменен":
                    return 2;
                case "Завершен":
                    return 3;
                default:
                    return -1;
            }
        }
        private int GetPointID(string point)
        {
            switch (point)
            {
                case "ЦДМ":
                    return 1;
                case "ТРЦ ЕВРОПЕЙСКИЙ":
                    return 2;
                case "ТРЦ РИО":
                    return 3;
                case "ТРЦ \"Океания\" 3 этаж":
                    return 4;
                case "Outlet Village Белая Дача":
                    return 5;
                case "ТЦ \"АЭРОБУС\"":
                    return 6;
                case "Vnukovo Premium Outlet":
                    return 7;
                case "ТРК \"ВЕГАС\"":
                    return 8;
                default:
                    return -1;
            }
        }
        private void Save(object sender, RoutedEventArgs e)
        {
            try
            {
                if (currentOrder.id_users == 0 || statusComboBox.SelectedItem == null || pointComboBox.SelectedItem == null)
                {
                    MessageBox.Show("Не все поля заполнены!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                currentOrder.id_status = GetStatusID(statusComboBox.SelectedItem.ToString());
                currentOrder.id_point = GetPointID(pointComboBox.SelectedItem.ToString());

                if (currentOrder.id == 0)
                {
                    imp.GetContext().orders.Add(currentOrder);
                }

                imp.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена!", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
                Close();
                WindowClosed?.Invoke(this, EventArgs.Empty);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void Cancel(object sender, RoutedEventArgs e)
        {
            Close();
        }
        private void MouseDownHandler(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
            {
                DragMove();
            }
        }
        private void ToolBar_MouseDown(object sender, MouseButtonEventArgs e)
        {
            MouseDownHandler(sender, e);
        }
        private void LogoContainer_MouseDown(object sender, MouseButtonEventArgs e)
        {
            MouseDownHandler(sender, e);
        }
        private void MinBtn_MouseDown(object sender, MouseButtonEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }
        private void CloseBtn_MouseDown(object sender, MouseButtonEventArgs e)
        {
            Close();
            WindowClosed?.Invoke(this, EventArgs.Empty);
        }
    }
}
