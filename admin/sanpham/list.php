<div class="row">
    <div class="row frmtitle mb">
        <h1>DANH SÁCH LOẠI HÀNG HÓA</h1>
    </div>
    <form action="index.php?act=listsp" method="post">
        <input type="text" name="kyw">
        <select name="iddm">
            <option value="0" select>Tất cả</option>
        </select>
        <input type="submit" name="listok" value="FIND">
    </form>
    <div class="row frmcontent">
        <div class="row mb10 frmdsloai">
            
            <table>
                <tr>
                    <th>STT</th>
                    <th>TÊN SẢN PHẨM</th>
                    <th>HÌNH</th>
                    <th>GIÁ</th>
                    <th>GIẢM GIÁ</th>
                    <th>LƯỢT XEM</th>
                    <th>TRẠNG THÁI</th>
                    <th>HÀNH ĐỘNG</th>
                </tr>

            </table>
        </div>
        <div class="row mb10">
            <a href="index.php?act=addsp">
                <input type="button" value="NHẬP THÊM">
            </a>
        </div>
    </div>
</div>