/**Dependencias
*
* Gritter
* blockUi - http://malsup.com/jquery/block/
*
*/
(function($){
    $.fn.gui = function(attr)
    {

        var settings = {method: '', id: '', url: '', title: '', text: '', image: '', sticky: '', time: '', module: '', action: '', status: '' };
        parameters = jQuery.extend(settings, attr);
        /*var options = new Array();
        options['add'] = add();
        options['close']= close();
        options['remove']= block();
        options['growl'] = growl();
        
        alert(options);*/
        
        if (parameters.method == 'add'){
            add();
        }

        if(parameters.method == 'close'){
            close();
        }
        
        if(parameters.method == 'remove'){
            remove();
        }

        if(parameters.method == 'block'){
            block();
        }
        
        if(parameters.method == 'growl')
        {
            growl();
        }
        
        if(parameters.method == 'pagination')
        {
            pagination();
        }

        if(parameters.method == 'run')
        {
            run();
        }
        
        if(parameters.method == 'checkall')
        {
            checkall();
        }

        //Agrega tab
        function add()
        {
            url = "/backend/"+parameters.module+"/"+parameters.action+"/"+parameters.id;
    		$('ul.content-box-tabs li a.default-tab').removeClass('current'); // Remove "current" class from all tabs
            $('ul.content-box-tabs').append('<li><a class="current current-tab" href="'+url+'">'+parameters.title+'</a></li>');
    		$('.content-box-content').load('/backend/'+ parameters.module +'/'+ parameters.action +'/'+ parameters.id);
        }
        
        //Cerrar tab
        function close()
        {
            $('.current').remove();
            $('ul.content-box-tabs li a.default-tab').addClass('current');
            $('.tab-content').load('/backend/'+ parameters.module +'/list/');
        }
        
        //Eliminar un registro
        function remove()
        {
            module = parameters.module;
    	    action = parameters.action;
    	    id = parameters.id;
            
            $.getJSON('/backend/'+ module +'/delete/'+id,function(json){
        	    $().gui({method:'growl', title: json.title, text: json.text, image:json.image, sticky:false});
                $().gui({method: 'run', id: id, module: module, action: action});
            });
        }
        
        function block()
        {
            $.blockUI({message: $('#question'), 
    	            ceterY: 0,
    	            css: { 
                        width: '280px',
                        height: '65px',
                        top: '15px', 
                        left: '', 
                        right: '20px', 
                        //padding: '5px',
                        border: '1px solid color #fff', 
                        backgroundColor: '#000', 
                        '-webkit-border-radius': '10px', 
                        '-moz-border-radius': '10px', 
                    }
             });
        }
        
        //Notificaciones
        function growl()
        {
            var unique_id = $.gritter.add({
    	        title: parameters.title,
    	        text: parameters.text,
    	        image: parameters.image,
    	        sticky: parameters.sticky,
    	        time: parameters.time
    	    });
    	    return false;
        }
        
        //Paginacion
        function pagination()
        {
            $('.tab-content').load(parameters.url);
        }
        
        //Ejecuta una accion desde un select
        function run()
        {
    	    module = parameters.module;
    	    action = parameters.action;
    	    id = parameters.id;
    	    
    	    $('.tab-content').load("/backend/"+ module +"/list/");
        }
        
        //Selecciona todos los checbox
        function checkall()
        {
    	   $("input[name='check[]']").each(function(){
    	       this.checked = parameters.status;
    	   });
        }
    };
})(jQuery);