<%@ page language="C#" autoeventwireup="true" inherits="Login, App_Web_i3kdr5tc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16"  href="Image/HRLogoIcon.png">
    <title>Attendance,Leave and Payroll</title>
	<link rel="canonical" href="https://www.wrappixel.com/templates/xtremeadmin/" />
    <!-- Custom CSS -->
    <link href="../../dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-wrapper">
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Login box.scss -->
        <!-- ============================================================== -->
        <div class="auth-wrapper d-flex no-block justify-content-center align-items-center" style="background:url(../../assets/images/big/auth-bg.jpg) no-repeat center center;">
            <div class="auth-box">
                <div id="loginform">
                    <div class="logo">
                        <span class="db"><img src="https://hrworld.org.pk/logo.png" alt="logo" width="100" /></span>
                        <br /> <br />
                        <h5 class="font-medium mb-3">HR World International</h5>
                    </div>
                    <!-- Form -->
                    <div class="row">
                        <div class="col-12">
                            <form class="form-horizontal mt-3" id="loginform" action="https://www.wrappixel.com/demos/admin-templates/xtreme-admin/html/light-sidebar/index.html">

                                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="true" ></asp:Label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1"><i class="ti-user"></i></span>
                                    </div>
                                      <asp:TextBox ID="txtuser" placeholder="Enter Admin Code" CssClass="form-control form-control-lg" ria-describedby="basic-addon1" required="" runat="server"></asp:TextBox>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon2"><i class="ti-pencil"></i></span>
                                    </div>
                                    <asp:TextBox ID="txtpassword" placeholder="Enter Password" CssClass="form-control form-control-lg" TextMode="Password" aria-label="Password" aria-describedby="basic-addon1" required="" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customCheck1">
                                            <label class="custom-control-label" for="customCheck1">Remember me</label>
                                            <a href="javascript:void(0)" id="to-recover" class="text-dark float-right"><i class="fa fa-lock mr-1"></i> Forgot pwd?</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group text-center">
                                    <div class="col-xs-12 pb-3">
                                         <asp:Button ID="btnSignIn" CssClass="btn btn-block btn-lg btn-info" runat="server" Text="Sign In" OnClick="btnSignIn_Click" />
                                    </div>
                                </div>
                                <%--<div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 mt-2 text-center">
                                        <div class="social">
                                            <a href="javascript:void(0)" class="btn  btn-facebook" data-toggle="tooltip" title="" data-original-title="Login with Facebook"> <i aria-hidden="true" class="fab  fa-facebook"></i> </a>
                                            <a href="javascript:void(0)" class="btn btn-googleplus" data-toggle="tooltip" title="" data-original-title="Login with Google"> <i aria-hidden="true" class="fab  fa-google-plus"></i> </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mb-0 mt-2">
                                    <div class="col-sm-12 text-center">
                                        Don't have an account? <a href="authentication-register1.html" class="text-info ml-1"><b>Sign Up</b></a>
                                    </div>
                                </div>--%>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="recoverform">
                    <div class="logo">
                        <span class="db"><img src="../../assets/images/logo-icon.png" alt="logo" /></span>
                        <h5 class="font-medium mb-3">Recover Password</h5>
                        <span>Enter your Email and instructions will be sent to you!</span>
                    </div>
                    <div class="row mt-3">
                        <!-- Form -->
                        <form class="col-12" >
                            <!-- email -->
                            <div class="form-group row">
                                <div class="col-12">
                                    <asp:TextBox ID="txtEmail" placeholder="Enter Employee Code" CssClass="form-control form-control-lg" runat="server"></asp:TextBox>
                                   <%-- <input class="form-control form-control-lg" type="email" required="" placeholder="Username">--%>
                                </div>
                            </div>
                            <!-- pwd -->
                            <div class="row mt-3">
                                <div class="col-12">
                                    <asp:Button ID="btnSendPassEmail" CssClass="btn btn-block btn-lg btn-danger" runat="server" Text="Forget Password" OnClick="btnSendPassEmail_Click" />
                                  <%--  <button class="btn btn-block btn-lg btn-danger" type="submit" name="action">Reset</button>--%>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Login box.scss -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper scss in scafholding.scss -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper scss in scafholding.scss -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Right Sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Right Sidebar -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- All Required js -->
    <!-- ============================================================== -->
    <script src="../../assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../../assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="../../assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
         <script src="../../assets/libs/sweetalert2/dist/sweetalert2.all.min.js"></script>
        <script src="../../assets/libs/sweetalert2/sweet-alert.init.js"></script>
    <!-- ============================================================== -->
    <!-- This page plugin js -->
    <!-- ============================================================== -->
    <script>
    $('[data-toggle="tooltip"]').tooltip();
    $(".preloader").fadeOut();
    // ============================================================== 
    // Login and Recover Password 
    // ============================================================== 
    $('#to-recover').on("click", function() {
        $("#loginform").slideUp();
        $("#recoverform").fadeIn();
    });
    </script>
        <script>    
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_endRequest(prm_endRequest);
            function Approve() {
                toastr.success('Approved', 'Request', { positionClass: 'toastr toast-bottom-left', containerId: 'toast-bottom-left' });

            }
            function Info(Header, Details) {
                toastr.info(Details, Header, { positionClass: 'toastr toast-bottom-left', containerId: 'toast-bottom-left' });

            }
            function Warning(Header, Details) {
                toastr.Warning(Details, Header, { positionClass: 'toastr toast-bottom-left', containerId: 'toast-bottom-left' });

            }
            function Errorss(Details) {
                Swal.fire({
                    type: 'error',
                    title: 'Oops...',
                    text: Details,
                    footer: '<a href>Please take screen shot and send to Admin</a>'
                })

            }
            function Reject() {
                toastr.error('Rejected', 'Request', { positionClass: 'toastr toast-bottom-left', containerId: 'toast-bottom-left' });
            }
            function SaveUpdate(Header, Details) {
                Swal.fire(Header, Details, "success")
            }
            //function SaveUpdate(Header, Details) {
            //    Swal.fire(Header, Details, "success")
            //}
            function Save() {

                Swal.fire({
                    position: 'top-end',
                    type: 'success',
                    title: 'Your record has been saved',
                    showConfirmButton: false,
                    timer: 1500
                });
            }
            function Update() {

                Swal.fire({
                    position: 'top-end',
                    type: 'success',
                    title: 'Your record has been updated',
                    showConfirmButton: false,
                    timer: 1500
                });
            }
            function Delete() {

                Swal.fire({
                    position: 'top-end',
                    type: 'success',
                    title: 'Your record has been deleted',
                    showConfirmButton: false,
                    timer: 1500
                });
            }
            function Details(Details, type) {

                Swal.fire({
                    position: 'top-end',
                    type: type,
                    title: Details,
                    showConfirmButton: false,
                    timer: 1500
                });
            }

            function AutoClose2Sec(Header, Details) {
                Swal.fire({
                    title: Header,
                    text: Details,
                    timer: 2000,
                    showConfirmButton: false
                });
            }


            function AutoClose2Sec() {

                Swal.fire({
                    position: 'top-end',
                    type: 'success',
                    title: 'Your work has been saved',
                    showConfirmButton: false,
                    timer: 1500
                });
            }


            function DeleteConfirm() {
                Swal.fire({
                    title: 'Are you sure to delete?',
                    text: "You won't be able to revert this!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.value) {
                        Swal.fire(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                        )
                    }
                })

            }



        </script>
    </form>
</body>
</html>
