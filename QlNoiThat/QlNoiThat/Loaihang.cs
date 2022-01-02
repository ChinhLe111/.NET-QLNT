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
    public partial class Loaihang : Form
    {
        SqlConnection connection;
        SqlCommand command;
        string str = @"Data Source=LAPTOP-QLLB0L9G\SQLEXPRESS;Initial Catalog=QLNoithat;Integrated Security=True";
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataTable table = new DataTable();

       void loaddata()
        {
           command = connection.CreateCommand();
           command.CommandText = "select * from Kho";   
           adapter.SelectCommand = command;
           table.Clear();
           adapter.Fill(table);
           dataGridView1.DataSource = table;
        }
        public Loaihang()
        {
            InitializeComponent();
        }

        private void Loaihang_Load(object sender, EventArgs e)
        {
           
             connection = new SqlConnection(str);
             connection.Open();
             loaddata();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            command = connection.CreateCommand();
            command.CommandText = "update Kho set LoaiHang='" + txtLoai.Text + "',DonViTinh='" + txtDV.Text + "',TonKho='" + txtTon.Text + "',GiaTriTon='" + txtGTT.Text + "' where MaHang='" + txtMa.Text + "' ";
            command.ExecuteNonQuery();
            loaddata();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMa.ReadOnly = true;
            int j;
            j = dataGridView1.CurrentRow.Index;
            //dgv.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            txtMa.Text = dataGridView1.Rows[j].Cells[0].Value.ToString();
            txtLoai.Text = dataGridView1.Rows[j].Cells[1].Value.ToString();
            txtDV.Text = dataGridView1.Rows[j].Cells[2].Value.ToString();
            txtTon.Text = dataGridView1.Rows[j].Cells[3].Value.ToString();
            txtGTT.Text = dataGridView1.Rows[j].Cells[4].Value.ToString();         

        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Close();

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void txtKey_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnsearch_Click(object sender, EventArgs e)
        {
            command = connection.CreateCommand();
            command.CommandText = "select * from Kho where TenHang like '%" + txtKey.Text + "%'";
            command.ExecuteNonQuery();
            loaddata();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            command = connection.CreateCommand();
            command.CommandText = "insert into Kho values('" + txtMa.Text + "', '" + txtLoai.Text + "','" + txtDV.Text + "','" + txtTon.Text + "','" + txtGTT.Text + "')";
            command.ExecuteNonQuery();
            loaddata();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa dữ liệu này?", "Cảnh báo!", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                command = connection.CreateCommand();
                command.CommandText = "delete from Kho where MaHang='" + txtMa.Text + "' ";
                command.ExecuteNonQuery();
                loaddata();
            }
        }
    }
}
