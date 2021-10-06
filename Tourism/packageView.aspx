<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="packageView.aspx.cs" Inherits="Tourism.packageView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-4">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="row">
                    <div class="col-md-4">
                        <div class="row">
                            <asp:Image ID="Image1" class="img-fliud p-2" runat="server" ImageUrl='<%# Eval("images") %>' />                          
                        </div>                        
                    </div>
                    <div class="col-md-8 ">
                       <div class="row">
                           <div class="col-md-12">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("package_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                           </div>
                       </div>         
                        <div class="card">
                            <div class="card-body">
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("package_category") %>'></asp:Label>
                                <p class="font-weight-bold p-1">Price: RS. <%#Eval("price") %> /<span class="text-muted"> person</span></p>
                                <div class="col-sm-2">
                                    <span class="Days p-1 text-white d-flex text-center">1D-1N</span>                       
                                </div>
                            </div>                        
                        </div>  
                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label ID="Label4" runat="server" Font-Italic="True" Text='<%# Eval("description") %>'></asp:Label>
                            </div>                            
                        </div>   
                    </br>
                        <div class="col-6">
			                <a href="Packages/packageBooked.aspx" class="btn btn-secondary col-my-4 mx-3">Book Package</a>
			            </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tourismDBConnectionString2 %>" SelectCommand="SELECT * FROM [package_management_tbl]"></asp:SqlDataSource>
    </div>
</asp:Content>
