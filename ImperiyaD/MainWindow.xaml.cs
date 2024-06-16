using ImperiyaD.classes;
using ImperiyaD.models;
using ImperiyaD.windows;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace ImperiyaD
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            manager.MainFrame = MainFrame;
        }
        private void autorizacia(object sender, RoutedEventArgs e)
        {
            AuthorizeWindow auth = new AuthorizeWindow();
            Window currentWindow = Window.GetWindow(this);
            currentWindow.Close();
            auth.Show();
        }
    }
}
