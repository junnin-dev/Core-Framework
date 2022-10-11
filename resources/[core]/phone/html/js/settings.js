JN.Phone.Settings = {};
JN.Phone.Settings.Background = "default-core";
JN.Phone.Settings.OpenedTab = null;
JN.Phone.Settings.Backgrounds = {
    'default-core': {
        label: "Standard Core"
    }
};

var PressedBackground = null;
var PressedBackgroundObject = null;
var OldBackground = null;
var IsChecked = null;

$(document).on('click', '.settings-app-tab', function(e){
    e.preventDefault();
    var PressedTab = $(this).data("settingstab");

    if (PressedTab == "background") {
        JN.Phone.Animations.TopSlideDown(".settings-"+PressedTab+"-tab", 200, 0);
        JN.Phone.Settings.OpenedTab = PressedTab;
    } else if (PressedTab == "profilepicture") {
        JN.Phone.Animations.TopSlideDown(".settings-"+PressedTab+"-tab", 200, 0);
        JN.Phone.Settings.OpenedTab = PressedTab;
    } else if (PressedTab == "numberrecognition") {
        var checkBoxes = $(".numberrec-box");
        JN.Phone.Data.AnonymousCall = !checkBoxes.prop("checked");
        checkBoxes.prop("checked", JN.Phone.Data.AnonymousCall);

        if (!JN.Phone.Data.AnonymousCall) {
            $("#numberrecognition > p").html('Off');
        } else {
            $("#numberrecognition > p").html('On');
        }
    }
});

$(document).on('click', '#accept-background', function(e){
    e.preventDefault();
    var hasCustomBackground = JN.Phone.Functions.IsBackgroundCustom();

    if (hasCustomBackground === false) {
        JN.Phone.Notifications.Add("fas fa-paint-brush", "Settings", JN.Phone.Settings.Backgrounds[JN.Phone.Settings.Background].label+" is set!")
        JN.Phone.Animations.TopSlideUp(".settings-"+JN.Phone.Settings.OpenedTab+"-tab", 200, -100);
        $(".phone-background").css({"background-image":"url('/html/img/backgrounds/"+JN.Phone.Settings.Background+".png')"})
    } else {
        JN.Phone.Notifications.Add("fas fa-paint-brush", "Settings", "Personal background set!")
        JN.Phone.Animations.TopSlideUp(".settings-"+JN.Phone.Settings.OpenedTab+"-tab", 200, -100);
        $(".phone-background").css({"background-image":"url('"+JN.Phone.Settings.Background+"')"});
    }

    $.post('https://phone/SetBackground', JSON.stringify({
        background: JN.Phone.Settings.Background,
    }))
});

JN.Phone.Functions.LoadMetaData = function(MetaData) {
    if (MetaData.background !== null && MetaData.background !== undefined) {
        JN.Phone.Settings.Background = MetaData.background;
    } else {
        JN.Phone.Settings.Background = "default-core";
    }

    var hasCustomBackground = JN.Phone.Functions.IsBackgroundCustom();

    if (!hasCustomBackground) {
        $(".phone-background").css({"background-image":"url('/html/img/backgrounds/"+JN.Phone.Settings.Background+".png')"})
    } else {
        $(".phone-background").css({"background-image":"url('"+JN.Phone.Settings.Background+"')"});
    }

    if (MetaData.profilepicture == "default") {
        $("[data-settingstab='profilepicture']").find('.settings-tab-icon').html('<img src="./img/default.png">');
    } else {
        $("[data-settingstab='profilepicture']").find('.settings-tab-icon').html('<img src="'+MetaData.profilepicture+'">');
    }
}

$(document).on('click', '#cancel-background', function(e){
    e.preventDefault();
    JN.Phone.Animations.TopSlideUp(".settings-"+JN.Phone.Settings.OpenedTab+"-tab", 200, -100);
});

JN.Phone.Functions.IsBackgroundCustom = function() {
    var retval = true;
    $.each(JN.Phone.Settings.Backgrounds, function(i, background){
        if (JN.Phone.Settings.Background == i) {
            retval = false;
        }
    });
    return retval
}

$(document).on('click', '.background-option', function(e){
    e.preventDefault();
    PressedBackground = $(this).data('background');
    PressedBackgroundObject = this;
    OldBackground = $(this).parent().find('.background-option-current');
    IsChecked = $(this).find('.background-option-current');

    if (IsChecked.length === 0) {
        if (PressedBackground != "custom-background") {
            JN.Phone.Settings.Background = PressedBackground;
            $(OldBackground).fadeOut(50, function(){
                $(OldBackground).remove();
            });
            $(PressedBackgroundObject).append('<div class="background-option-current"><i class="fas fa-check-circle"></i></div>');
        } else {
            JN.Phone.Animations.TopSlideDown(".background-custom", 200, 13);
        }
    }
});

$(document).on('click', '#accept-custom-background', function(e){
    e.preventDefault();

    JN.Phone.Settings.Background = $(".custom-background-input").val();
    $(OldBackground).fadeOut(50, function(){
        $(OldBackground).remove();
    });
    $(PressedBackgroundObject).append('<div class="background-option-current"><i class="fas fa-check-circle"></i></div>');
    JN.Phone.Animations.TopSlideUp(".background-custom", 200, -23);
});

$(document).on('click', '#cancel-custom-background', function(e){
    e.preventDefault();

    JN.Phone.Animations.TopSlideUp(".background-custom", 200, -23);
});

// Profile Picture

var PressedProfilePicture = null;
var PressedProfilePictureObject = null;
var OldProfilePicture = null;
var ProfilePictureIsChecked = null;

$(document).on('click', '#accept-profilepicture', function(e){
    e.preventDefault();
    var ProfilePicture = JN.Phone.Data.MetaData.profilepicture;
    if (ProfilePicture === "default") {
        JN.Phone.Notifications.Add("fas fa-paint-brush", "Settings", "Standard avatar set!")
        JN.Phone.Animations.TopSlideUp(".settings-"+JN.Phone.Settings.OpenedTab+"-tab", 200, -100);
        $("[data-settingstab='profilepicture']").find('.settings-tab-icon').html('<img src="./img/default.png">');
    } else {
        JN.Phone.Notifications.Add("fas fa-paint-brush", "Settings", "Personal avatar set!")
        JN.Phone.Animations.TopSlideUp(".settings-"+JN.Phone.Settings.OpenedTab+"-tab", 200, -100);
        $("[data-settingstab='profilepicture']").find('.settings-tab-icon').html('<img src="'+ProfilePicture+'">');
    }
    $.post('https://phone/UpdateProfilePicture', JSON.stringify({
        profilepicture: ProfilePicture,
    }));
});

$(document).on('click', '#accept-custom-profilepicture', function(e){
    e.preventDefault();
    JN.Phone.Data.MetaData.profilepicture = $(".custom-profilepicture-input").val();
    $(OldProfilePicture).fadeOut(50, function(){
        $(OldProfilePicture).remove();
    });
    $(PressedProfilePictureObject).append('<div class="profilepicture-option-current"><i class="fas fa-check-circle"></i></div>');
    JN.Phone.Animations.TopSlideUp(".profilepicture-custom", 200, -23);
});

$(document).on('click', '.profilepicture-option', function(e){
    e.preventDefault();
    PressedProfilePicture = $(this).data('profilepicture');
    PressedProfilePictureObject = this;
    OldProfilePicture = $(this).parent().find('.profilepicture-option-current');
    ProfilePictureIsChecked = $(this).find('.profilepicture-option-current');
    if (ProfilePictureIsChecked.length === 0) {
        if (PressedProfilePicture != "custom-profilepicture") {
            JN.Phone.Data.MetaData.profilepicture = PressedProfilePicture
            $(OldProfilePicture).fadeOut(50, function(){
                $(OldProfilePicture).remove();
            });
            $(PressedProfilePictureObject).append('<div class="profilepicture-option-current"><i class="fas fa-check-circle"></i></div>');
        } else {
            JN.Phone.Animations.TopSlideDown(".profilepicture-custom", 200, 13);
        }
    }
});

$(document).on('click', '#cancel-profilepicture', function(e){
    e.preventDefault();
    JN.Phone.Animations.TopSlideUp(".settings-"+JN.Phone.Settings.OpenedTab+"-tab", 200, -100);
});


$(document).on('click', '#cancel-custom-profilepicture', function(e){
    e.preventDefault();
    JN.Phone.Animations.TopSlideUp(".profilepicture-custom", 200, -23);
});
