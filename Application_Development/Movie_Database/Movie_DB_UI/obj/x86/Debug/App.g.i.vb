﻿#ExternalChecksum("C:\Users\troyp\Documents\GitHub\Development\Application_Development\Movie_Database\Movie_DB_UI\App.xaml", "{8829d00f-11b8-4213-878b-770e8597ac16}", "6B8662C6EA6D946363349223B2FA7F569B57CBD959A68E7EC8F76FA85D95B4D0")
'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict Off
Option Explicit On

Namespace Global.Movie_DB_UI

#If Not DISABLE_XAML_GENERATED_MAIN Then
Public Class Program

    <MTAThread()> _
        <Global.System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.Windows.UI.Xaml.Build.Tasks", "14.0.0.0")>  _
        <Global.System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Shared Sub Main(ByVal args() As String)
        Global.Windows.UI.Xaml.Application.Start(Function(p) New Global.Movie_DB_UI.App())
    End Sub

        <Global.System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.Windows.UI.Xaml.Build.Tasks", "14.0.0.0")>  _
        <Global.System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Sub Program
    End Sub

End Class
#End If


<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>  _
Partial Class App
    Inherits Global.Windows.UI.Xaml.Application

    Private _contentLoaded As Boolean
        <Global.System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.Windows.UI.Xaml.Build.Tasks", "14.0.0.0")>  _
        <Global.System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Public Sub InitializeComponent()
        If _contentLoaded Then
            Return
        End If
        _contentLoaded = true

#If Debug AndAlso Not DISABLE_XAML_GENERATED_BINDING_DEBUG_OUTPUT Then
        AddHandler Me.DebugSettings.BindingFailed,
            Sub(Sender As Global.System.Object, bindingFailedArgs As Global.Windows.UI.Xaml.BindingFailedEventArgs)
                Global.System.Diagnostics.Debug.WriteLine(bindingFailedArgs.Message)
            End Sub
#End If

#If Debug AndAlso Not DISABLE_XAML_GENERATED_BREAK_ON_UNHANDLED_EXCEPTION Then
        AddHandler Me.UnhandledException,
            Sub(sender As Global.System.Object, unhandledExceptionArgs As Global.Windows.UI.Xaml.UnhandledExceptionEventArgs)
                If Global.System.Diagnostics.Debugger.IsAttached Then
                    Global.System.Diagnostics.Debugger.Break()
                End If
            End Sub
#End If
    End Sub

End Class

End Namespace

