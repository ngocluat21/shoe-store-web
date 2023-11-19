<?php
    include "../model/pdo.php";
    include "../model/danhmuc.php";
    include "../model/sanpham.php";
    include "../model/color_size.php";
    include "header.php";
    if (!isset($_SESSION['currentNumber'])) {
        $_SESSION['currentNumber'] = 1000;
    }
    //controller
    if (isset($_GET['act'])) {
        $act = $_GET['act'];
        switch ($act) {
            //danh mục
            case 'adddm':
                include "danhmuc/add.php";
                break;
            case 'listdm':
                include "danhmuc/list.php";
                break;
            case 'suadm':
                include "danhmuc/update.php";
                break;
            case 'updatedm':
                include "danhmuc/list.php";
                break;

            //sản phẩm
            case 'addsp':
                include "sanpham/add.php";
                break;
            case 'suasp':
                include "sanpham/spbt.php";
                break;
            case 'spbt':
                include "sanpham/list.php";
                break;
            case 'addmau_size':
                include "color_size/addcolor_size.php";
                break;
            case 'listms':
                include "color_size/listcolor_size.php";
                break;
            case 'suamau':
                include "color_size/update_m.php";
                break;
            case 'updatemau':
                include "color_size/listcolor_size.php";
                break;
            case 'suasize':
                include "color_size/update_s.php";
                break;
            case 'updatesize':
                include "color_size/listcolor_size.php";
                break;
            case 'listsp':
                include "sanpham/list.php";
                break;
            case 'xoasp':
                include "sanpham/list.php";
                break;

            //tài khoản
            case 'addtk':
                include "taikhoan/add.php";
                break;
            case 'dskh':
                include "taikhoan/list.php";
                break;
            case 'xoatk':
                include "taikhoan/list.php";
                break;
            case 'updatetk':
                include "taikhoan/list.php.php";
                break;
    
            //binhluan
            case 'dsbl':
                include "binhluan/list.php";
                break;
            case 'thongke':
                include "thongke/list.php";
                break;
            case 'bieudo':
                include "thongke/bieudo.php";
                break;

            default:
                include "home.php";
                break;
        }
        
    } else {
        include "home.php";
    }
    include "footer.php";
?>