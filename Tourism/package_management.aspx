<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="package_management.aspx.cs" Inherits="Tourism.package_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">        
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first")))
                .DataTable({
                    paging: true,
                    info: false,
                    fixedHeader: {
                        header: true,
                        footer: true
                    }
                });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        img{
            border-radius: 50%;
        }
    </style>
    <div class="container shadow p-3 mb-5 bg-body rounded" >
        <div class="row">
            <div class="col-md-5">
                    <div class="row">
                        <div class="col-md-12">
                            <center>
                                <h4>Package Details</h4>
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <center>
                                <img id="imgview" width="100" height="100" src="All_Packages/package.png" />
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <hr>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                        </div>
                    </div>
                    <div class="row p-2">
                        <div class="col-md-4">
                            <label>Package ID</label>  
                            <div class="form-group input-group-text">                                                                
                                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                <asp:Button class="btn btn-primary" ID="Button4" runat="server" Text=" Go" OnClick="Button4_Click" ></asp:Button>
                            </div>                      
                        </div>
                        <div class="col-md-8">
                            <label>Package Name</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Package Name"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Price Per Night(Per Person)</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Price"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
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
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Package Description</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Package Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-md-3">
                            <asp:Button ID="Button1" class="btn rounded-pill  btn-block btn-success" runat="server" Text="Add" OnClick="Button1_Click" />
                        </div>
                        <div class="col-md-3">
                            <asp:Button ID="Button3" class="btn rounded-pill  btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                        </div>
                        <div class="col-md-3">
                            <asp:Button ID="Button2" class="btn rounded-pill  btn-block btn-danger" runat="server" Text="Delete" OnClick="Button2_Click" />
                        </div>
                    </div>


                    <a href="homepage.aspx"><< Back to Home</a><br>
                    <br>
                </div>
            
            <div class="col p-0" >
                <!--<div class="container-fluid"> -->
                <div class="row">
                    <div class="col-md">
                        <center>
                            <h4>Package List</h4>
                        </center>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md">
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tourismDBConnectionString %>" SelectCommand="SELECT * FROM [package_management_tbl]"></asp:SqlDataSource>
                    <div class="col-md">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="package_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="package_id" HeaderText="ID" ReadOnly="True" SortExpression="package_id" />

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("package_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            Category:
                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("package_category") %>'></asp:Label>

                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            Price:
                                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("price") %>'></asp:Label>

                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">

                                                            <asp:Label ID="Label4" runat="server" Font-Italic="True" Text='<%# Eval("description") %>'></asp:Label>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:Image ID="Image1" class="img-fliud p-2" runat="server" ImageUrl='<%# Eval("images") %>' />
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
