using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

class View extends Ui.View {
	var background;
	var centerx;
	var centery;
	
    //! Load your resources here
    function onLayout(dc) {
        background = Ui.loadResource(Rez.Drawables.background);  
        // background loaded
    }

    //! Called when this View is brought to the foreground. Restore
    //! the state of this View and prepare it to be shown. This includes
    //! loading resources into memory.
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
        // Set background image
        dc.drawBitmap(0, 0, background);
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        var x = dc.getWidth()*2 / 3;
        var y = dc.getHeight() / 3;
        // Get and show the current time
        var clockTime = Sys.getClockTime();
        var timeString = Lang.format("$1$:$2$:$3$", [
  			clockTime.hour.format("%02d"),
  			clockTime.min.format("%02d"),
  			clockTime.sec.format("%02d")
		]);
        
        dc.drawText(x, y, Gfx.FONT_LARGE, timeString, Gfx.TEXT_JUSTIFY_CENTER);

    }

    //! Called when this View is removed from the screen. Save the
    //! state of this View here. This includes freeing resources from
    //! memory.
    function onHide() {
    }

    //! The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    //! Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
