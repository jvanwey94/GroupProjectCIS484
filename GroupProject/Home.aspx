<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <style type="text/css">
        .panel-heading-custom {
            background: #f1f8e9; 
            color: #1b5e20;
        }

        .organizationID {
            background: #795548;
        }
    </style>
    

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="panel-heading panel-heading-custom">Dashboard<i class="fa fa-dashboard fa-fw"></i></h1>
                </div>
                <!-- /.col-lg-12 -->
            
            <!-- /.row -->
            
              <a href="Program.aspx">
                
                <div class="col-lg-4 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-calendar fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>Manage Programs</div>
                                </div>
                            </div>
                        </div>
                        
                            <div class="panel-footer">
                                <span class="pull-left">Get Started</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                    </div>
                    </div>
                    
                    </a>
                
                <div class="col-lg-4 col-md-6">
                   <a href="Animal.aspx">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <img src="leaflet/images/icon.png" style="width:70px; height:70px;" />
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>Manage Animals</div>
                                </div>
                            </div>
                        </div>
                        
                            <div class="panel-footer">
                                <span class="pull-left">Get Started</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                    </div>
                    </a>
                </div>
               
                
                <div class="col-lg-4 col-md-6">
                    <a href="FinancialReport.aspx">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-dollar fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>Financial Payments</div>
                                </div>
                            </div>
                        </div>
                            <div class="panel-footer">
                                <span class="pull-left">Get Started</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                       
                    </div>
                    </a>
                </div>
                
                <div class="col-lg-4 col-md-6">
                   <a href="Organization.aspx">
                    <div class="panel panel-default">
                        <div class="panel-heading custom_class" style="background-color:#795548; color:#fff;">
                            <div class="row">
                                <div class="col-xs-3">
                                    <img src="leaflet/images/notebook.png" style="width:70px; height:70px;" />
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>Manage Organization</div>
                                </div>
                            </div>
                        </div>
                        
                            <div class="panel-footer">
                                <span class="pull-left">Get Started</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                    </div>
                    </a>
                </div>

                <div class="col-lg-4 col-md-6">
                   <a href="Category.aspx">
                    <div class="panel panel-green">
                        <div class="panel-heading custom_class" style="background-color:#26a69a; color:#fff;">
                            <div class="row">
                                <div class="col-xs-3">
                                    <img src="leaflet/images/list.png" style="width:70px; height:70px;" />
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>Manage Category</div>
                                </div>
                            </div>
                        </div>
                        
                            <div class="panel-footer">
                                <span class="pull-left">Get Started</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                    </div>
                    </a>
                </div>

                <div class="col-lg-4 col-md-6">
                   <a href="EducatorPage.aspx">
                    <div class="panel panel-green">
                        <div class="panel-heading custom_class" style="background-color:#9e9d24; color:#fff">
                            <div class="row">
                                <div class="col-xs-3">
                                    <img src="leaflet/images/class.png" style="width:70px; height:70px;" />
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>Manage Educator</div>
                                </div>
                            </div>
                        </div>
                        
                            <div class="panel-footer">
                                <span class="pull-left">Get Started</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                    </div>
                    </a>
                </div>
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8" id="areaChart">
                    <div class="panel panel-heading-custom">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Animal Programs
                            <div class="pull-right">
                               
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div>
                                <div class='tableauPlaceholder' id='viz1543379132133' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;da&#47;dash_54&#47;Dashboard2&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='dash_54&#47;Dashboard2' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;da&#47;dash_54&#47;Dashboard2&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='filter' value='publish=yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1543379132133');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>
                                
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
                    <!-- /.panel -->
            </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
</asp:Content>
