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
using Dealership_BD1._2.DealershipDataSetTableAdapters;

namespace Dealership_BD1._2
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        OrdersTableAdapter context = new OrdersTableAdapter();
        public MainWindow()
        {
            InitializeComponent();
            OrdersDrd.ItemsSource = context.GetFullInfo();
        }

        private void exit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            OrdersDrd.Columns[0].Visibility = Visibility.Collapsed;
            OrdersDrd.Columns[1].Visibility = Visibility.Collapsed;
            OrdersDrd.Columns[2].Visibility = Visibility.Collapsed;
            OrdersDrd.Columns[5].Visibility = Visibility.Collapsed;
            OrdersDrd.Columns[11].Visibility = Visibility.Collapsed;
            OrdersDrd.Columns[12].Visibility = Visibility.Collapsed;
            OrdersDrd.Columns[13].Visibility = Visibility.Collapsed;

            OrdersDrd.Columns[3].Header = "Дата";
            OrdersDrd.Columns[4].Header = "Количество";
            OrdersDrd.Columns[6].Header = "Фамилия";
            OrdersDrd.Columns[7].Header = "Имя";
            OrdersDrd.Columns[8].Header = "Отчество";
            OrdersDrd.Columns[9].Header = "Номер телефона";
            OrdersDrd.Columns[10].Header = "Почта";
            OrdersDrd.Columns[14].Header = "Модель авто";
            OrdersDrd.Columns[15].Header = "Бренд авто";
            OrdersDrd.Columns[16].Header = "Год";
            OrdersDrd.Columns[17].Header = "Цена";
        }
    }
}
