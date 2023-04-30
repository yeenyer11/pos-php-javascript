<?php
$query_order = "
SELECT o.*,m.mem_name
FROM tbl_order as o
INNER JOIN tbl_member as m ON o.mem_id = m.mem_id
";
$rs_order = mysqli_query($condb, $query_order);
$roworder = mysqli_fetch_array($rs_order);
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
    <h1>ประวัติการสั่งซื้อ</h1>
    </div><!-- /.container-fluid -->
  </section>
  <!-- Main content -->
  <section class="content">
    <div class="card card-gray">
      <div class="card-header ">
        <h3 class="card-title">รายการขาย</h3>
        <div align="right">

        </div>
      </div>
      <br>
      <div class="card-body">
        <div class="row">
          
          <div class="col-md-12">
            <table id="example1" class="table table-bordered  table-hover table-striped">
              <thead>
                <tr class="danger">
                  <th width="5%"><center>No.</center></th>
                  <th width="10%">พนักงานขาย</th>
                  <th width="35%">Status</th>
                  <th width="20%">date</th>
                  <th width="20%">จัดการ</th>                  
                </tr>              
              </thead>
              <tbody>
                <?php 
                foreach($rs_order as $row){ ?>
                
                
                    <tr>
                      <td><?php echo @$l+=1; ?></td>
                      <td><?php echo $row['mem_name']; ?></td>
                      <td><?php echo $row['b_name']; ?></td>
                      <td><?php echo $row['order_date']; ?></td>                    
                      <td><a href="order_detail.php?order_id=<?php echo $row['order_id']; ?>" class="btn btn-success" >
    <i class="fas fas fa-file"></i> ประวัติการซื้อ</a></td>
                      
                    </tr>
                    <?php }?>
                
              </tbody>
            </table>
            
            
            
          </div>
          
        </div>
      </div>
      <div class="card-footer">
        
      </div>
      
    </div>
    
    
    
    
  </section>