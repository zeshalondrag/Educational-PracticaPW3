using Dealership_BD1._2.DealershipDataSetTableAdapters;
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

namespace Dealership_BD1._2
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        OrdersTableAdapter orders = new OrdersTableAdapter();
        public MainWindow()
        {
            InitializeComponent();
            OrdersDrd.ItemsSource = orders.GetData();
        }

        private void exit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            OrdersDrd.Columns[0].Visibility = Visibility.Collapsed;
            OrdersDrd.Columns[3].Visibility = Visibility.Collapsed;
            OrdersDrd.Columns[9].Visibility = Visibility.Collapsed;
            OrdersDrd.Columns[10].Visibility = Visibility.Collapsed;
            OrdersDrd.Columns[11].Visibility = Visibility.Collapsed;

            OrdersDrd.Columns[1].Header = "Дата";
            OrdersDrd.Columns[2].Header = "Количество";
            OrdersDrd.Columns[4].Header = "Фамилия";
            OrdersDrd.Columns[5].Header = "Имя";
            OrdersDrd.Columns[6].Header = "Отчество";
            OrdersDrd.Columns[7].Header = "Номер телефона";
            OrdersDrd.Columns[8].Header = "Почта";
            OrdersDrd.Columns[12].Header = "Модель авто";
            OrdersDrd.Columns[13].Header = "Бренд авто";
            OrdersDrd.Columns[14].Header = "Год";
            OrdersDrd.Columns[15].Header = "Цена";
        }
    }
}