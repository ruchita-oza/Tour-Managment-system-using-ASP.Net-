<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="packageView.aspx.cs" Inherits="Tourism.packageView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-4">
    <div class="row">
        <div class="col-md-4">
            <div class="row">
                <img src="imgs/allpackages/romanticgoa.jpg" width="250px" height="250px">
            </div>
            <div class=" row ">                
                
            </div>
        </div>
        <div class="col-md-8 ">
            <h5>Romantic goa</h5>            
            <div class="card">
                <div class="card-body">
                    <p><b>Price for 1-Day and 1-Night : RS. 24600</b></p>
                </div>
            </div>
            
            <span class="Days p-1 text-white d-flex text-center" style="margin-left: 290px; margin-top: -30px; padding-bottom: -10px; ">1D-1N</span>
            <p>enjoy </p>
            <div class="col-6">
			    <a href="Packages/packageBooked.aspx" class="btn btn-secondary col-my-4 mx-3">Book Package</a>
			</div>
        </div>
    </div>
</div>
</asp:Content>
