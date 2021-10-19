<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About_Us.aspx.cs" Inherits="Tourism.About_Us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous"/>
    <link rel="stylesheet" href="css/style.css"/>
        
    <section>
        <div class="container">
            <div class="card">
                <div class="content">
                    <div class="imgBx"><img src="imgs/about/user1.jpg" /></div>
                    <div class="contentBx">
                        <h3>Hetvee sakaria<br /><span>website owner</span></h3>
                    </div>
                </div>
                <ul class="sci">
                    <li style="--i:1">
                        <a href="#"><i class="fab fa-facebook-f "></i></a>
                    </li>
                    <li style="--i:1">
                        <a href="#"><i class="fab fa-twitter "></i></a>
                    </li>
                    <li style="--i:1">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </li>
                </ul>
            </div>

            <div class="card">
                <div class="content">
                    <div class="imgBx"><img src="imgs/about/user2.jfif" /></div>
                    <div class="contentBx">
                        <h3>Ruchita oza<br /><span>Website owner</span></h3>
                    </div>
                </div>
                <ul class="sci">
                    <li style="--i:1">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                    </li>
                    <li style="--i:2">
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </li>
                    <li style="--i:3">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </li>
                </ul>
            </div>
        </div>        
    </section>
</asp:Content>
