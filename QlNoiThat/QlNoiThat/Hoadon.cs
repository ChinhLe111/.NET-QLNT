using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QlNoiThat
{
    public partial class Hoadon : Form
    {
        SqlConnection connection;
        SqlCommand command;
        string str = @"Data Source=LAPTOP-QLLB0L9G\SQLEXPRESS;Initial Catalog=QLNoithat;Integrated Security=True";
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataTable table = new DataTable();
        void loaddata()
        {
            command = connection.CreateCommand();
            command.CommandText = "select * from Hoadon";
            adapter.SelectCommand = command;
            table.Clear();
            adapter.Fill(table);
            dataGridView1.DataSource = table;
        }
        public Hoadon()
        {
            InitializeComponent();
        }

        private void Hoadon_Load(object sender, EventArgs e)
        {
            connection = new SqlConnection(str);
            connection.Open();
            loaddata();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaHoaDon.ReadOnly = true;
            int i;
            i = dataGridView1.CurrentRow.Index;
            txtMaHoaDon.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa hóa đơn này?", "Cảnh báo!", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                command = connection.CreateCommand();
                command.CommandText = "delete from Hoadon where MaHoaDon='" + txtMaHoaDon.Text + "' ";
                command.ExecuteNonQuery();
                loaddata();
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
