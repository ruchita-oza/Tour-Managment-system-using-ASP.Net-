<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="package_management.aspx.cs" Inherits="Tourism.package_management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
            img {
                  border-radius: 50%;
            }
    </style>
    <div class="container">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4><b>PACKAGES DETAILS</b></h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                        <img width="100px" src="imgs/package.png" />        
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row"> 
                            <div class="col-md-4">
                                <label>Package ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Package Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Package Name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <label>Package Category</label>
                                <div class="form-group">
                                   <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                      <asp:ListItem Text="Select" Value="select" />
                                       <asp:ListItem Text="International Packages" Value="International Packages" />
                                      <asp:ListItem Text="National Packages" Value="National Packages" />
                                      <asp:ListItem Text="Domestic Holiday Packages" Value="Domestic Holiday Packages" />
                                   </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <label>Price</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Price"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <label>Description</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Description" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>

                           <div class="col-md-12">
                               <label>Images</label>
                             <div class="form-group"">
                                <asp:FileUpload class="form-control" ID="FileUpload1" runat="server" />                                    
                             </div>
                          </div>

                        </div>
                        <br /><br>

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button4_Click" />
                            </div>
                        </div>


                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home</a><br>
                <br>
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4><b>PACKAGES LIST</b></h4>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tourismDBConnectionString2 %>" SelectCommand="SELECT * FROM [package_management_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="package_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="package_id" HeaderText="Package ID" InsertVisible="False" ReadOnly="True" SortExpression="package_id" />
                                        <asp:BoundField DataField="package_name" HeaderText="Package Name" SortExpression="package_name" />
                                        <asp:BoundField DataField="package_category" HeaderText="Category" SortExpression="package_category" />
                                        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>


            </div>

        </div>
    </div>
</asp:Content>
