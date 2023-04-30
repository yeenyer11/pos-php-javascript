<?php include("header.php"); 
$order_id = mysqli_real_escape_string($condb, $_GET['order_id']);
$queryorderdetail = "

SELECT d.*,p.p_img, p.p_name, p.p_price, h.*, m.mem_name
FROM tbl_order_detail as d
INNER JOIN tbl_order as h ON d.order_id = h.order_id
INNER JOIN tbl_member as m ON h.mem_id = m.mem_id
INNER JOIN tbl_product as p ON d.p_id = p.p_id
WHERE d.order_id=$order_id";
$rsdetail = mysqli_query($condb, $queryorderdetail);
$rowdetail = mysqli_fetch_array($rsdetail);
?>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function readURL(input) {
if (input.files && input.files[0]) {
var reader = new FileReader();
reader.onload = function (e) {
$('#blah').attr('src', e.target.result);
}
reader.readAsDataURL(input.files[0]);
}
}
</script>
<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <h1>Order</h1>
    </div><!-- /.container-fluid -->
  </section>
  <!-- Main content -->
  <section class="content">
    <div class="card card-gray">
      <div class="card-header ">
        <h3 class="card-title">รายละเอียดการสั่งซื้อ</h3>

       
      </div>
      <div align="center">
        <h4>รายการสั่งซื้อ<br>
            OrderID : <?php echo $rowdetail['order_id'];?>   <br>
            วันทำรายการ:<?php echo $rowdetail['order_date'];?> <br>
            ผู้ทำรายการ : <?php echo $rowdetail['mem_name'];?><br>
            สถานะ : <?php echo $rowdetail['b_name'];?><br>
    </h4>


        </div>
      <br>
      <div class="card-body">
        <div class="row">
          
        <div class="col-12 col-sm-12 col-md-12">
        <table border="0" align="center" class="table table-hover table-bordered table-striped">
            <thead>
              <tr>
                <td width="5%" align="center">ลำดับสินค้า</td>
                 <td width="10%" align="center">img</td>
                 <td width="35%" align="center">สินค้า</td>
                 <td width="15%" align="center">ราคา</td>
                 <td width="10%" align="center">จำนวน</td>
                 <td width="15%" align="center">รวม(บาท)</td>
     
            </tr>
                <?php
                
                $total=0;
                foreach($rsdetail as $row){

                $total +=$row ["total"];     
                $change=$row ["pay_amount2"] - $total;
                    echo "<tr>";
                    echo "<td>" . $i+=1 . "</td>";
                    echo "<td>"."<img src='../p_img/".$row['p_img']."' width='100%'>"."</td>";
                    echo "<td>" . $row["p_name"];                     
                    echo "<td align='right'>" .number_format($row["p_price"],2) . "</td>";      
                    //$pqty = $row['p_qty'];//ประกาศตัวแปรจำนวนสินค้าใน stock
                    echo "<td align='right'>" .number_format($row["p_c_qty"]) . "</td>";         
                    echo "<td align='right'>".number_format($row["total"],2)."</td>";
                }//close foreach
                echo "<tr>";
	
	            echo "<td></td>";
	            echo "<td></td>";
	            echo "<td></td>";
            	echo "<td  align='center'><b>ราคารวม</b><br><b>ยอดเงินที่รับชำระ</b><br><b>เงินถอน</b></td>";
            	echo "<td align='right'colspan='2'>"."<b>".number_format($total,2)."<br>".number_format($row["pay_amount2"],2)."<br>".number_format($change,2)."</b>"."</td>"; 
         
              
              

	            echo "</tr>";
              
                ?>
              </thead>
              <tbody>
                
              </tbody>
            </table>
            <tr>
            <a href="#" target="" class="btn btn-success" onclick="window.print()">Print</a>
            
            
          </div>
          
        </div>
      </div>
      <div class="card-footer">
        
      </div>
      
    </div>
    
    
    
    
  </section>
  <!-- /.content -->
  
  
  <?php include('footer.php'); ?>
  <script>
  $(function () {
  $(".datatable").DataTable();
  // $('#example2').DataTable({
  //   "paging": true,
  //   "lengthChange": false,
  //   "searching": false,
  //   "ordering": true,
  //   "info": true,
  //   "autoWidth": false,

  // });
  });
  </script>
  
</body>
</html>