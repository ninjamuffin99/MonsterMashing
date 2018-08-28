// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_haxe_Timer
#include <haxe/Timer.h>
#endif
#ifndef INCLUDED_openfl__legacy_Lib
#include <openfl/_legacy/Lib.h>
#endif
#ifndef INCLUDED_openfl__legacy_events_Event
#include <openfl/_legacy/events/Event.h>
#endif
#ifndef INCLUDED_openfl__legacy_events_EventDispatcher
#include <openfl/_legacy/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl__legacy_events_IEventDispatcher
#include <openfl/_legacy/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_openfl__legacy_sensors_Accelerometer
#include <openfl/_legacy/sensors/Accelerometer.h>
#endif
#ifndef INCLUDED_openfl_errors_ArgumentError
#include <openfl/errors/ArgumentError.h>
#endif
#ifndef INCLUDED_openfl_errors_Error
#include <openfl/errors/Error.h>
#endif
#ifndef INCLUDED_openfl_events_AccelerometerEvent
#include <openfl/events/AccelerometerEvent.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_b2e57bcd8564fdde_22_new,"openfl._legacy.sensors.Accelerometer","new",0xcade6608,"openfl._legacy.sensors.Accelerometer.new","openfl/_legacy/sensors/Accelerometer.hx",22,0x8f38e36b)
HX_LOCAL_STACK_FRAME(_hx_pos_b2e57bcd8564fdde_32_addEventListener,"openfl._legacy.sensors.Accelerometer","addEventListener",0x7bdf0d25,"openfl._legacy.sensors.Accelerometer.addEventListener","openfl/_legacy/sensors/Accelerometer.hx",32,0x8f38e36b)
HX_LOCAL_STACK_FRAME(_hx_pos_b2e57bcd8564fdde_40_setRequestedUpdateInterval,"openfl._legacy.sensors.Accelerometer","setRequestedUpdateInterval",0xe57aee52,"openfl._legacy.sensors.Accelerometer.setRequestedUpdateInterval","openfl/_legacy/sensors/Accelerometer.hx",40,0x8f38e36b)
HX_LOCAL_STACK_FRAME(_hx_pos_b2e57bcd8564fdde_68___update,"openfl._legacy.sensors.Accelerometer","__update",0x4922da81,"openfl._legacy.sensors.Accelerometer.__update","openfl/_legacy/sensors/Accelerometer.hx",68,0x8f38e36b)
HX_LOCAL_STACK_FRAME(_hx_pos_b2e57bcd8564fdde_90_get_isSupported,"openfl._legacy.sensors.Accelerometer","get_isSupported",0xf554a623,"openfl._legacy.sensors.Accelerometer.get_isSupported","openfl/_legacy/sensors/Accelerometer.hx",90,0x8f38e36b)
HX_LOCAL_STACK_FRAME(_hx_pos_b2e57bcd8564fdde_18_boot,"openfl._legacy.sensors.Accelerometer","boot",0xafd3e18a,"openfl._legacy.sensors.Accelerometer.boot","openfl/_legacy/sensors/Accelerometer.hx",18,0x8f38e36b)
HX_LOCAL_STACK_FRAME(_hx_pos_b2e57bcd8564fdde_100_boot,"openfl._legacy.sensors.Accelerometer","boot",0xafd3e18a,"openfl._legacy.sensors.Accelerometer.boot","openfl/_legacy/sensors/Accelerometer.hx",100,0x8f38e36b)
namespace openfl{
namespace _legacy{
namespace sensors{

void Accelerometer_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_b2e57bcd8564fdde_22_new)
HXLINE(  24)		super::__construct(null());
HXLINE(  26)		this->muted = false;
HXLINE(  27)		this->setRequestedUpdateInterval(::openfl::_legacy::sensors::Accelerometer_obj::_hx___defaultInterval);
            	}

Dynamic Accelerometer_obj::__CreateEmpty() { return new Accelerometer_obj; }

void *Accelerometer_obj::_hx_vtable = 0;

Dynamic Accelerometer_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< Accelerometer_obj > _hx_result = new Accelerometer_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool Accelerometer_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x25b00754) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x25b00754;
	} else {
		return inClassId==(int)0x26396d8a;
	}
}

void Accelerometer_obj::addEventListener(::String type, ::Dynamic listener,hx::Null< bool >  __o_useCapture,hx::Null< int >  __o_priority,hx::Null< bool >  __o_useWeakReference){
bool useCapture = __o_useCapture.Default(false);
int priority = __o_priority.Default(0);
bool useWeakReference = __o_useWeakReference.Default(false);
            	HX_STACKFRAME(&_hx_pos_b2e57bcd8564fdde_32_addEventListener)
HXLINE(  34)		this->super::addEventListener(type,listener,useCapture,priority,useWeakReference);
HXLINE(  35)		this->_hx___update();
            	}


void Accelerometer_obj::setRequestedUpdateInterval(Float interval){
            	HX_GC_STACKFRAME(&_hx_pos_b2e57bcd8564fdde_40_setRequestedUpdateInterval)
HXLINE(  42)		if ((interval < (int)0)) {
HXLINE(  44)			HX_STACK_DO_THROW( ::openfl::errors::ArgumentError_obj::__alloc( HX_CTX ,null()));
            		}
            		else {
HXLINE(  46)			if ((interval == (int)0)) {
HXLINE(  48)				interval = ::openfl::_legacy::sensors::Accelerometer_obj::_hx___defaultInterval;
            			}
            		}
HXLINE(  52)		if (hx::IsNotNull( this->_hx___timer )) {
HXLINE(  54)			this->_hx___timer->stop();
            		}
HXLINE(  58)		if (::openfl::_legacy::sensors::Accelerometer_obj::get_isSupported()) {
HXLINE(  60)			this->_hx___timer =  ::haxe::Timer_obj::__alloc( HX_CTX ,interval);
HXLINE(  61)			this->_hx___timer->run = this->_hx___update_dyn();
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC1(Accelerometer_obj,setRequestedUpdateInterval,(void))

void Accelerometer_obj::_hx___update(){
            	HX_GC_STACKFRAME(&_hx_pos_b2e57bcd8564fdde_68___update)
HXLINE(  70)		 ::openfl::events::AccelerometerEvent event =  ::openfl::events::AccelerometerEvent_obj::__alloc( HX_CTX ,HX_("update",09,86,05,87),null(),null(),null(),null(),null(),null());
HXLINE(  71)		 ::Dynamic data = ::openfl::_legacy::sensors::Accelerometer_obj::lime_input_get_acceleration();
HXLINE(  73)		event->timestamp = ::haxe::Timer_obj::stamp();
HXLINE(  74)		event->accelerationX = ( (Float)(data->__Field(HX_("x",78,00,00,00),hx::paccDynamic)) );
HXLINE(  75)		event->accelerationY = ( (Float)(data->__Field(HX_("y",79,00,00,00),hx::paccDynamic)) );
HXLINE(  76)		event->accelerationZ = ( (Float)(data->__Field(HX_("z",7a,00,00,00),hx::paccDynamic)) );
HXLINE(  78)		this->dispatchEvent(event);
            	}


HX_DEFINE_DYNAMIC_FUNC0(Accelerometer_obj,_hx___update,(void))

bool Accelerometer_obj::isSupported;

int Accelerometer_obj::_hx___defaultInterval;

bool Accelerometer_obj::get_isSupported(){
            	HX_STACKFRAME(&_hx_pos_b2e57bcd8564fdde_90_get_isSupported)
HXDLIN(  90)		return hx::IsNotNull( ::openfl::_legacy::sensors::Accelerometer_obj::lime_input_get_acceleration() );
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(Accelerometer_obj,get_isSupported,return )

 ::Dynamic Accelerometer_obj::lime_input_get_acceleration;


hx::ObjectPtr< Accelerometer_obj > Accelerometer_obj::__new() {
	hx::ObjectPtr< Accelerometer_obj > __this = new Accelerometer_obj();
	__this->__construct();
	return __this;
}

hx::ObjectPtr< Accelerometer_obj > Accelerometer_obj::__alloc(hx::Ctx *_hx_ctx) {
	Accelerometer_obj *__this = (Accelerometer_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Accelerometer_obj), true, "openfl._legacy.sensors.Accelerometer"));
	*(void **)__this = Accelerometer_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

Accelerometer_obj::Accelerometer_obj()
{
}

void Accelerometer_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Accelerometer);
	HX_MARK_MEMBER_NAME(muted,"muted");
	HX_MARK_MEMBER_NAME(_hx___timer,"__timer");
	 ::openfl::_legacy::events::EventDispatcher_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void Accelerometer_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(muted,"muted");
	HX_VISIT_MEMBER_NAME(_hx___timer,"__timer");
	 ::openfl::_legacy::events::EventDispatcher_obj::__Visit(HX_VISIT_ARG);
}

hx::Val Accelerometer_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"muted") ) { return hx::Val( muted ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"__timer") ) { return hx::Val( _hx___timer ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"__update") ) { return hx::Val( _hx___update_dyn() ); }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"addEventListener") ) { return hx::Val( addEventListener_dyn() ); }
		break;
	case 26:
		if (HX_FIELD_EQ(inName,"setRequestedUpdateInterval") ) { return hx::Val( setRequestedUpdateInterval_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

bool Accelerometer_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 11:
		if (HX_FIELD_EQ(inName,"isSupported") ) { outValue = ( inCallProp == hx::paccAlways ? get_isSupported() : isSupported ); return true; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"get_isSupported") ) { outValue = get_isSupported_dyn(); return true; }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"__defaultInterval") ) { outValue = ( _hx___defaultInterval ); return true; }
		break;
	case 27:
		if (HX_FIELD_EQ(inName,"lime_input_get_acceleration") ) { outValue = ( lime_input_get_acceleration ); return true; }
	}
	return false;
}

hx::Val Accelerometer_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"muted") ) { muted=inValue.Cast< bool >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"__timer") ) { _hx___timer=inValue.Cast<  ::haxe::Timer >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

bool Accelerometer_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 11:
		if (HX_FIELD_EQ(inName,"isSupported") ) { isSupported=ioValue.Cast< bool >(); return true; }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"__defaultInterval") ) { _hx___defaultInterval=ioValue.Cast< int >(); return true; }
		break;
	case 27:
		if (HX_FIELD_EQ(inName,"lime_input_get_acceleration") ) { lime_input_get_acceleration=ioValue.Cast<  ::Dynamic >(); return true; }
	}
	return false;
}

void Accelerometer_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("muted","\x6b","\x8f","\x5b","\x10"));
	outFields->push(HX_HCSTRING("__timer","\xa5","\x18","\x94","\x7a"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo Accelerometer_obj_sMemberStorageInfo[] = {
	{hx::fsBool,(int)offsetof(Accelerometer_obj,muted),HX_HCSTRING("muted","\x6b","\x8f","\x5b","\x10")},
	{hx::fsObject /*::haxe::Timer*/ ,(int)offsetof(Accelerometer_obj,_hx___timer),HX_HCSTRING("__timer","\xa5","\x18","\x94","\x7a")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo Accelerometer_obj_sStaticStorageInfo[] = {
	{hx::fsBool,(void *) &Accelerometer_obj::isSupported,HX_HCSTRING("isSupported","\xe4","\x7c","\x8a","\xf3")},
	{hx::fsInt,(void *) &Accelerometer_obj::_hx___defaultInterval,HX_HCSTRING("__defaultInterval","\x06","\x68","\xe4","\xd4")},
	{hx::fsObject /*Dynamic*/ ,(void *) &Accelerometer_obj::lime_input_get_acceleration,HX_HCSTRING("lime_input_get_acceleration","\x08","\x97","\x2e","\x7e")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static ::String Accelerometer_obj_sMemberFields[] = {
	HX_HCSTRING("muted","\x6b","\x8f","\x5b","\x10"),
	HX_HCSTRING("__timer","\xa5","\x18","\x94","\x7a"),
	HX_HCSTRING("addEventListener","\xcd","\x0b","\x64","\xf1"),
	HX_HCSTRING("setRequestedUpdateInterval","\xfa","\xce","\x5f","\x28"),
	HX_HCSTRING("__update","\x29","\xf1","\x34","\x2f"),
	::String(null()) };

static void Accelerometer_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Accelerometer_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(Accelerometer_obj::isSupported,"isSupported");
	HX_MARK_MEMBER_NAME(Accelerometer_obj::_hx___defaultInterval,"__defaultInterval");
	HX_MARK_MEMBER_NAME(Accelerometer_obj::lime_input_get_acceleration,"lime_input_get_acceleration");
};

#ifdef HXCPP_VISIT_ALLOCS
static void Accelerometer_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Accelerometer_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(Accelerometer_obj::isSupported,"isSupported");
	HX_VISIT_MEMBER_NAME(Accelerometer_obj::_hx___defaultInterval,"__defaultInterval");
	HX_VISIT_MEMBER_NAME(Accelerometer_obj::lime_input_get_acceleration,"lime_input_get_acceleration");
};

#endif

hx::Class Accelerometer_obj::__mClass;

static ::String Accelerometer_obj_sStaticFields[] = {
	HX_HCSTRING("isSupported","\xe4","\x7c","\x8a","\xf3"),
	HX_HCSTRING("__defaultInterval","\x06","\x68","\xe4","\xd4"),
	HX_HCSTRING("get_isSupported","\x7b","\x34","\x6c","\xb4"),
	HX_HCSTRING("lime_input_get_acceleration","\x08","\x97","\x2e","\x7e"),
	::String(null())
};

void Accelerometer_obj::__register()
{
	hx::Object *dummy = new Accelerometer_obj;
	Accelerometer_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("openfl._legacy.sensors.Accelerometer","\x16","\x02","\xa9","\xab");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &Accelerometer_obj::__GetStatic;
	__mClass->mSetStaticField = &Accelerometer_obj::__SetStatic;
	__mClass->mMarkFunc = Accelerometer_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(Accelerometer_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(Accelerometer_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< Accelerometer_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = Accelerometer_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Accelerometer_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Accelerometer_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void Accelerometer_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_b2e57bcd8564fdde_18_boot)
HXDLIN(  18)		_hx___defaultInterval = (int)34;
            	}
{
            	HX_STACKFRAME(&_hx_pos_b2e57bcd8564fdde_100_boot)
HXDLIN( 100)		lime_input_get_acceleration = ::openfl::_legacy::Lib_obj::load(HX_("lime-legacy",c1,7f,b9,87),HX_("lime_legacy_input_get_acceleration",6a,88,04,03),(int)0);
            	}
}

} // end namespace openfl
} // end namespace _legacy
} // end namespace sensors
