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
    public partial class Khachhang : Form
    {
        SqlConnection connection;
        SqlCommand command;
        string str = @"Data Source=LAPTOP-QLLB0L9G\SQLEXPRESS;Initial Catalog=QLNoithat;Integrated Security=True";
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataTable table = new DataTable();

        void loaddata()
        {
            command = connection.CreateCommand();
            command.CommandText = "select * from Khachhang";
            adapter.SelectCommand = command;
            table.Clear();
            adapter.Fill(table);
            dataGridView1.DataSource = table;
        }
        public Khachhang()
        {
            InitializeComponent();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaK.ReadOnly = true;
            int j;
            j = dataGridView1.CurrentRow.Index;
            //dgv.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            txtMaK.Text = dataGridView1.Rows[j].Cells[0].Value.ToString();
            txtTenK.Text = dataGridView1.Rows[j].Cells[1].Value.ToString();
            txtGT.Text = dataGridView1.Rows[j].Cells[2].Value.ToString();
            txtSDT.Text = dataGridView1.Rows[j].Cells[3].Value.ToString();
            txtDC.Text = dataGridView1.Rows[j].Cells[4].Value.ToString();
            txtEmail.Text = dataGridView1.Rows[j].Cells[5].Value.ToString();
        }

        private void Khachhang_Load(object sender, EventArgs e)
        {
            connection = new SqlConnection(str);
            connection.Open();
            loaddata();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            command = connection.CreateCommand();
            command.CommandText = "insert into Khachhang values('" + txtMaK.Text + "', '" + txtTenK.Text + "','" + txtGT.Text + "','" + txtSDT.Text + "','" + txtDC.Text + "','" + txtEmail.Text + "')";
            command.ExecuteNonQuery();
            loaddata();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            command = connection.CreateCommand();
            command.CommandText = "update Khachhang set TenKhachHang='" + txtTenK.Text + "',GioiTinh='" + txtGT.Text + "',SoDienThoai='" + txtSDT.Text + "',DiaChi='" + txtDC.Text + "',Email='" + txtEmail.Text + "' where MaKhachHang='" + txtMaK.Text + "' ";
            command.ExecuteNonQuery();
            loaddata();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa dữ liệu này?", "Cảnh báo!", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                command = connection.CreateCommand();
                command.CommandText = "delete from Khachhang where MaKhachHang='" + txtMaK.Text + "' ";
                command.ExecuteNonQuery();
                loaddata();
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Close(); 
        }
    }
}
