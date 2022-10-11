'use strict';

var JNRadialMenu = null;
var toggleConfig = false;
var keybindConfig = false;
$(document).ready(function(){
    window.addEventListener('message', function(event){
        switch (event.data.action) {
            case "ui":
                toggleConfig = event.data.toggle;
                keybindConfig = event.data.keybind;
                if (event.data.radial) {
                    createMenu(event.data.items)
                    JNRadialMenu.open();
                } else {
                    JNRadialMenu.close(true);
                }
                if (toggleConfig === false){
                     $(document).on('keyup', function(e) {
                         if(e.key == keybindConfig | e.key === keybindConfig.toLowerCase()){
                             JNRadialMenu.close();
                         }
                     });
                 } else {
                    $(document).on('keydown', function(e) {
                        switch(e.key) {
                            case keybindConfig:
                                JNRadialMenu.close();
                                break;
                        }
                    });
                 }
        }
    });
});
function createMenu(items) {
    JNRadialMenu = new RadialMenu({
        parent      : document.body,
        size        : 375,
        menuItems   : items,
        onClick     : function(item) {
            if (item.shouldClose) {
                JNRadialMenu.close(true);
            }
            
            if (item.items == null && item.shouldClose != null) {
                $.post('https://radialmenu/selectItem', JSON.stringify({
                    itemData: item
                }))
            }
        }
    });
}

// Close on escape pressed
$(document).on('keydown', function(e) {
    switch(e.key) {
        case "Escape":
            JNRadialMenu.close();
            break;
    }
});
