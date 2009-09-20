$(document).ready(function(){
    
	//Sidebar Accordion Menu:
		
		$("#main-nav li ul").hide(); //Hide all sub menus
		$("#main-nav li a.current").parent().find("ul").slideToggle("slow"); // Slide down the current menu item's sub menu
		
		$("#main-nav li a.nav-top-item").click( // When a top menu item is clicked...
			function () {
				$(this).parent().siblings().find("ul").slideUp("normal"); // Slide up all sub menus except the one clicked
				$(this).next().slideToggle("normal"); // Slide down the clicked sub menu
				return false;
			}
		);
		
		$("#main-nav li a.no-submenu").click( // When a menu item with no sub menu is clicked...
			function () {
				window.location.href=(this.href); // Just open the link instead of a sub menu
				return false;
			}
		); 

    // Sidebar Accordion Menu Hover Effect:
		
		$("#main-nav li .nav-top-item").hover(
			function () {
				$(this).animate({ paddingRight: "25px" }, 200);
			}, 
			function () {
				$(this).animate({ paddingRight: "15px" });
			}
		);

    //Minimize Content Box
		
		$(".content-box-header h3").css({ "cursor":"s-resize" }); // Give the h3 in Content Box Header a different cursor
		$(".content-box-header-toggled").next().hide(); // Hide the content of the header if it has the class "content-box-header-toggled"
		
		$(".content-box-header h3").click( // When the h3 is clicked...
			function () {
			  $(this).parent().parent().find(".content-box-content").toggle(); // Toggle the Content Box
			  $(this).parent().toggleClass("content-box-header-toggled"); // Give the Content Box Header a special class for styling and hiding
			  $(this).parent().find(".content-box-tabs").toggle(); // Toggle the tabs
			}
		);

    // Content box tabs:
		
		//$('.content-box .content-box-content div.tab-content').hide(); // Hide the content divs
		//$('.content-box-content div.default-tab').show(); // Show the div with class "default-tab"
		$('ul.content-box-tabs li a.default-tab').addClass('current'); // Set the class of the default tab link to "current"
		$('.content-box-content').load($('.default-tab').attr('href')); //Bug no deja carga wysuwyg
        //$('.content-box-content').live('nada',$.ajax({url:$('.default-tab').attr('href')}));
        
		$('.content-box ul.content-box-tabs li a').live('click', //When a tab is clicked...
			function() { 
				$(this).parent().siblings().find("a").removeClass('current'); // Remove "current" class from all tabs
				$(this).addClass('current'); // Add class "current" to clicked tab
				$('.content-box-content').load($(this).attr('href'));
				return false; 
			}
		);

    //Close button:
		
		$(".close").live('click',
			function () {
				$(this).parent().fadeTo(400, 0, function () { // Links with the class "close" will close parent
					$(this).slideUp(600);
				});
				return false;
			}
		);

    // Alternating table rows:
		
		$('tbody tr:even').addClass("alt-row"); // Add class "alt-row" to even table rows

    // Check all checkboxes when the one in a table head is checked:
		
		$('.check-all').click(
			function(){
				$(this).parent().parent().parent().parent().find("input[type='checkbox']").attr('checked', $(this).is(':checked'));   
			}
		)

    // Initialise Facebox Modal window:
		
	//	$('a[rel*=modal]').facebox(); // Applies modal window to any link with attribute rel="modal"

    // Initialise jQuery WYSIWYG:
		
		//$('.wysiwyg').wysiwyg();
});
  
  
