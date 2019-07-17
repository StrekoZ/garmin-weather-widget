//
// Copyright 2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;

var last_key = null;
var last_behavior = null;

// BehaviorDelegate handles behavior inputs. A BehaviorDelegate differs from
// an InputDelegate in that it acts upon device independent behaviours such as
// next page and previous page. On touch screen devices these behaviors might be
// mapped to the basic swipe left and right inputs, while on non-touch screen
// devices these behaviors might be mapped to actual keys.
// BehaviorDelegate extends InputDelegate so it can also act on basic inputs as
// well. If a BehaviorDelegate does return true for a function, indicating that
// the input was used, then the InputDelegate function that corresponds to the
// behavior will be called.
// @see InputDelegate
class MainInputDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    // When a next page behavior occurs, onNextPage() is called.
    // @return [Boolean] true if handled, false otherwise
    function onNextPage() {
        return false;
    }


    // When a previous page behavior occurs, onPreviousPage() is called.
    // @return [Boolean] true if handled, false otherwise
    function onPreviousPage() {
        return false;
    }


    function onSelect() {
        WatchUi.pushView(new DailyView(), new MainInputDelegate(), WatchUi.SLIDE_LEFT);
        WatchUi.requestUpdate();
        return true;
    }
/*

    // When a menu behavior occurs, onMenu() is called.
    // @return [Boolean] true if handled, false otherwise
    function onMenu();

    // When a back behavior occurs, onBack() is called.
    // @return [Boolean] true if handled, false otherwise
    function onBack();

    // When a next mode behavior occurs, onNextMode() is called.
    // @return [Boolean] true if handled, false otherwise
    function onNextMode();

    // When a previous mode behavior occurs, onPreviousMode() is called.
    // @return [Boolean] true if handled, false otherwise
    function onPreviousMode();
*/
}
/*

class InputDelegate extends WatchUi.BehaviorDelegate {

    enum {
        ON_NEXT_PAGE,
        ON_PREV_PAGE,
        ON_MENU,
        ON_BACK,
        ON_NEXT_MODE,
        ON_PREV_MODE,
        ON_SELECT
    }

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onNextPage() {
        last_behavior = ON_NEXT_PAGE;
        setBehaviorString("NEXT_PAGE");
        return false;
    }

    function onPreviousPage() {
        last_behavior = ON_PREV_PAGE;
        setBehaviorString("PREVIOUS_PAGE");
        return false;
    }

    function onMenu() {
        last_behavior = ON_MENU;
        setBehaviorString("ON_MENU");
        return false;
    }

    function onBack() {
        if (ON_BACK == last_behavior) {
            System.exit();
        }
        last_behavior = ON_BACK;
        setBehaviorString("ON_BACK");
        return false;
    }

    function onNextMode() {
        last_behavior = ON_NEXT_MODE;
        setBehaviorString("ON_NEXT_MODE");
        return false;
    }

    function onPreviousMode() {
        last_behavior = ON_PREV_MODE;
        setBehaviorString("ON_PREVIOUS_MODE");
        return false;
    }

    function onSelect() {
        last_behavior = ON_SELECT;
        setBehaviorString("ON_SELECT");
        return false;
    }

    function onTap(evt) {
        setActionString("CLICK_TYPE_TAP");
        return true;
    }

    function onHold(evt) {
        setActionString("CLICK_TYPE_HOLD");
        return true;
    }

    function onRelease(evt) {
        setActionString("CLICK_TYPE_RELEASE");
        return true;
    }

    function onSwipe(evt) {
        var swipe = evt.getDirection();

        if (swipe == SWIPE_UP) {
            setActionString("SWIPE_UP");
        } else if (swipe == SWIPE_RIGHT) {
            setActionString("SWIPE_RIGHT");
        } else if (swipe == SWIPE_DOWN) {
            setActionString("SWIPE_DOWN");
        } else if (swipe == SWIPE_LEFT) {
            setActionString("SWIPE_LEFT");
        }

        return true;
    }

    function onKey(evt) {
        var key = evt.getKey();
        var keyString = getKeyString( key );

        if( keyString != null ) {
            setActionString( keyString );
        }

        if (key == KEY_ESC) {
            if (last_key == KEY_ESC) {
                System.exit();
            }
        }

        last_key = key;

        return true;
    }

    function onKeyPressed(evt) {
        var keyString = getKeyString( evt.getKey() );
        if( keyString != null ) {
            setStatusString( keyString + " PRESSED" );
        }

        return true;
    }

    function onKeyReleased(evt) {
        var keyString = getKeyString( evt.getKey() );
        if( keyString != null ) {
            setStatusString( keyString + " RELEASED" );
        }

        return true;
    }

    function getKeyString(key) {
        if (key == KEY_POWER) {
            return "KEY_POWER";
        } else if (key == KEY_LIGHT) {
            return "KEY_LIGHT";
        } else if (key == KEY_ZIN) {
            return "KEY_ZIN";
        } else if (key == KEY_ZOUT) {
            return "KEY_ZOUT";
        } else if (key == KEY_ENTER) {
            return "KEY_ENTER";
        } else if (key == KEY_ESC) {
            return "KEY_ESC";
        } else if (key == KEY_FIND) {
            return "KEY_FIND";
        } else if (key == KEY_MENU) {
            return "KEY_MENU";
        } else if (key == KEY_DOWN) {
            return "KEY_DOWN";
        } else if (key == KEY_DOWN_LEFT) {
            return "KEY_DOWN_LEFT";
        } else if (key == KEY_DOWN_RIGHT) {
            return "KEY_DOWN_RIGHT";
        } else if (key == KEY_LEFT) {
            return "KEY_LEFT";
        } else if (key == KEY_RIGHT) {
            return "KEY_RIGHT";
        } else if (key == KEY_UP) {
            return "KEY_UP";
        } else if (key == KEY_UP_LEFT) {
            return "KEY_UP_LEFT";
        } else if (key == KEY_UP_RIGHT) {
            return "KEY_UP_RIGHT";
        } else if (key == KEY_PAGE) {
            return "KEY_PAGE";
        } else if (key == KEY_START) {
            return "KEY_START";
        } else if (key == KEY_LAP) {
            return "KEY_LAP";
        } else if (key == KEY_RESET) {
            return "KEY_RESET";
        } else if (key == KEY_SPORT) {
            return "KEY_SPORT";
        } else if (key == KEY_CLOCK) {
            return "KEY_CLOCK";
        } else if (key == KEY_MODE) {
            return "KEY_MODE";
        }

        return null;
    }
}
*/
