﻿package environment {    import flash.display.MovieClip;    import flash.display.DisplayObject;    import flash.display.Stage;    import flash.utils.getQualifiedClassName;    import environment.utils.*;     import environment.*;     import environment.rooms.*;    import environment.ui.*;    public class Environment extends MovieClip {        public static var rooms:Object;        public static var ui:Object = {};        public static var root:MovieClip;        public static var stage:Stage;        public static var view:DisplayObject;        private var swfLoader:Object;                public function Environment() {            var self = this;            //var url:String = this.loaderInfo.loaderURL;            //trace(url);            Environment.stage = this.stage;            Environment.view = this.root;            Environment.rooms = new RoomsController();            this.swfLoader = new SwfLoader();            this.swfLoader.loadFile('UI.swf', function(mc:MovieClip) {                 Environment.ui.inventory = new Inventory(mc['inventory']);                Environment.ui.dialog = new Dialog(mc['dialogBox']);                Environment.view['uiContainer'].addChild(mc);            });            /**             * Instantiate these rooms.             */            this.setRooms([                 new IntroDoor(),                new HallwayLegs(),                new LongHallway(),                new ShortHallway(),                new MainLobby()            ]);        }        public function setRooms(rooms:Array) {            Environment.rooms.setupRooms(rooms);        }        public static function getClassName(obj:Object) {            var objName:String = getQualifiedClassName(obj);            objName = objName.replace(/.*::/, '');            return objName;        }        public static function displayDialog(file) {            Environment.ui.dialog.showText(file);        }    }}