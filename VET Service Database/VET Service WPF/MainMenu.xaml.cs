using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
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
using VET_Service_API.Models;


namespace VET_Service_WPF
{
    /// <summary>
    /// Interaction logic for MainMenu.xaml
    /// </summary>
    public partial class MainMenu : Page
    {
        public MainMenu()
        {
            InitializeComponent();
        }

        class Procedures
        {
            public string ProcedureID { get; set; }
            public string ProcedureDescription { get; set; }
            public string ProcedurePrice { get; set; }
        }

        class Treatments
        {
            public string PetName { get; set; }
            public string OwnerID { get; set; }
            public string ProcedureID { get; set; }
            public string TreatmentDescription { get; set; }
            public string TreatmentPrice { get; set; }
        }

        private async void ViewData_Click(object sender, RoutedEventArgs e)
        {
            HttpClient client = new HttpClient();
            try
            {
                client.BaseAddress = new Uri("https://vetserviceapi101604238.azurewebsites.net");
                HttpResponseMessage httpResponseMessage = await client.GetAsync("api/Procedures");
                var content = await httpResponseMessage.Content.ReadAsStringAsync();
                var Procedures = JsonConvert.DeserializeObject<List<Procedure>>(content);
                ProceduresLV.ItemsSource = Procedures;

            }
            finally
            {
                client.Dispose();
            }
        }

        private async void ViewTreatments_Click(object sender, RoutedEventArgs e)
        {
            HttpClient client = new HttpClient();
            try
            {
                if (inputProcedureID.Text == "1")
                {
                    client.BaseAddress = new Uri("https://vetserviceapi101604238.azurewebsites.net");
                    HttpResponseMessage httpResponseMessage = await client.GetAsync("api/Treatments");
                    var content = await httpResponseMessage.Content.ReadAsStringAsync();
                    var Treatments = JsonConvert.DeserializeObject<List<Treatment>>(content);
                    List<Treatment> sortedList = new List<Treatment>();
                    

                    TreatmentsLV.ItemsSource = sortedList;
                }
                else if (inputProcedureID.Text == "5")
                {

                }
                else if (inputProcedureID.Text == "10")
                {

                }
                else if (inputProcedureID.Text == "8")
                {

                }
                else
                {
                    MessageBox.Show("This Procedure either doesn't exist or doesn't have any Treatments completed");
                }
            }
            finally
            {
                client.Dispose();
            }
        }
    }
}
