﻿#pragma checksum "..\..\..\pages\RootMerch.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "A42FEBB919ECD1F1D5DE5343D7642A3EB2A4923E2BC9F36C97EA0E175E75E52E"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using ImperiyaD.pages;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace ImperiyaD.pages {
    
    
    /// <summary>
    /// RootMerch
    /// </summary>
    public partial class RootMerch : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector, System.Windows.Markup.IStyleConnector {
        
        
        #line 28 "..\..\..\pages\RootMerch.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid MerchBD;
        
        #line default
        #line hidden
        
        
        #line 71 "..\..\..\pages\RootMerch.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGridTemplateColumn EditColumn;
        
        #line default
        #line hidden
        
        
        #line 96 "..\..\..\pages\RootMerch.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid NameSort;
        
        #line default
        #line hidden
        
        
        #line 97 "..\..\..\pages\RootMerch.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox SearchTextBox;
        
        #line default
        #line hidden
        
        
        #line 101 "..\..\..\pages\RootMerch.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid SortMan;
        
        #line default
        #line hidden
        
        
        #line 102 "..\..\..\pages\RootMerch.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox BrendComboBox;
        
        #line default
        #line hidden
        
        
        #line 106 "..\..\..\pages\RootMerch.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button AddButton;
        
        #line default
        #line hidden
        
        
        #line 111 "..\..\..\pages\RootMerch.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button OrdersButton;
        
        #line default
        #line hidden
        
        
        #line 116 "..\..\..\pages\RootMerch.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button RefButton;
        
        #line default
        #line hidden
        
        
        #line 121 "..\..\..\pages\RootMerch.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button HistoryButton;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/ImperiyaD;component/pages/rootmerch.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\pages\RootMerch.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.MerchBD = ((System.Windows.Controls.DataGrid)(target));
            return;
            case 2:
            this.EditColumn = ((System.Windows.Controls.DataGridTemplateColumn)(target));
            return;
            case 5:
            this.NameSort = ((System.Windows.Controls.Grid)(target));
            return;
            case 6:
            this.SearchTextBox = ((System.Windows.Controls.TextBox)(target));
            
            #line 97 "..\..\..\pages\RootMerch.xaml"
            this.SearchTextBox.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.SearchTextBox_TextChanged);
            
            #line default
            #line hidden
            return;
            case 7:
            this.SortMan = ((System.Windows.Controls.Grid)(target));
            return;
            case 8:
            this.BrendComboBox = ((System.Windows.Controls.ComboBox)(target));
            
            #line 102 "..\..\..\pages\RootMerch.xaml"
            this.BrendComboBox.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.BrendComboBox_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 9:
            this.AddButton = ((System.Windows.Controls.Button)(target));
            
            #line 106 "..\..\..\pages\RootMerch.xaml"
            this.AddButton.Click += new System.Windows.RoutedEventHandler(this.Add);
            
            #line default
            #line hidden
            return;
            case 10:
            this.OrdersButton = ((System.Windows.Controls.Button)(target));
            
            #line 111 "..\..\..\pages\RootMerch.xaml"
            this.OrdersButton.Click += new System.Windows.RoutedEventHandler(this.Orders);
            
            #line default
            #line hidden
            return;
            case 11:
            this.RefButton = ((System.Windows.Controls.Button)(target));
            
            #line 116 "..\..\..\pages\RootMerch.xaml"
            this.RefButton.Click += new System.Windows.RoutedEventHandler(this.Ref);
            
            #line default
            #line hidden
            return;
            case 12:
            this.HistoryButton = ((System.Windows.Controls.Button)(target));
            
            #line 121 "..\..\..\pages\RootMerch.xaml"
            this.HistoryButton.Click += new System.Windows.RoutedEventHandler(this.History);
            
            #line default
            #line hidden
            return;
            case 13:
            
            #line 127 "..\..\..\pages\RootMerch.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.Pods);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        void System.Windows.Markup.IStyleConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 3:
            
            #line 74 "..\..\..\pages\RootMerch.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.Edit);
            
            #line default
            #line hidden
            break;
            case 4:
            
            #line 85 "..\..\..\pages\RootMerch.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.Delete);
            
            #line default
            #line hidden
            break;
            }
        }
    }
}

