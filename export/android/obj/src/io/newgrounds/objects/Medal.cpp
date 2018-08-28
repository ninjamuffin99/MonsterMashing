// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_io_newgrounds_Call
#include <io/newgrounds/Call.h>
#endif
#ifndef INCLUDED_io_newgrounds_ICallable
#include <io/newgrounds/ICallable.h>
#endif
#ifndef INCLUDED_io_newgrounds_NG
#include <io/newgrounds/NG.h>
#endif
#ifndef INCLUDED_io_newgrounds_NGLite
#include <io/newgrounds/NGLite.h>
#endif
#ifndef INCLUDED_io_newgrounds_components_Component
#include <io/newgrounds/components/Component.h>
#endif
#ifndef INCLUDED_io_newgrounds_components_ComponentList
#include <io/newgrounds/components/ComponentList.h>
#endif
#ifndef INCLUDED_io_newgrounds_components_MedalComponent
#include <io/newgrounds/components/MedalComponent.h>
#endif
#ifndef INCLUDED_io_newgrounds_objects_Medal
#include <io/newgrounds/objects/Medal.h>
#endif
#ifndef INCLUDED_io_newgrounds_objects_Object
#include <io/newgrounds/objects/Object.h>
#endif
#ifndef INCLUDED_io_newgrounds_objects_events_Response
#include <io/newgrounds/objects/events/Response.h>
#endif
#ifndef INCLUDED_io_newgrounds_objects_events_Result
#include <io/newgrounds/objects/events/Result.h>
#endif
#ifndef INCLUDED_io_newgrounds_utils_Dispatcher
#include <io/newgrounds/utils/Dispatcher.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_86dc0cd60a499658_37_new,"io.newgrounds.objects.Medal","new",0xa44b2a75,"io.newgrounds.objects.Medal.new","io/newgrounds/objects/Medal.hx",37,0x7fbeb13c)
HX_LOCAL_STACK_FRAME(_hx_pos_86dc0cd60a499658_45_parse,"io.newgrounds.objects.Medal","parse",0xd1675988,"io.newgrounds.objects.Medal.parse","io/newgrounds/objects/Medal.hx",45,0x7fbeb13c)
HX_LOCAL_STACK_FRAME(_hx_pos_86dc0cd60a499658_67_sendUnlock,"io.newgrounds.objects.Medal","sendUnlock",0x4d0e0cb7,"io.newgrounds.objects.Medal.sendUnlock","io/newgrounds/objects/Medal.hx",67,0x7fbeb13c)
HX_LOCAL_STACK_FRAME(_hx_pos_86dc0cd60a499658_74_onUnlockResponse,"io.newgrounds.objects.Medal","onUnlockResponse",0x7417bbaf,"io.newgrounds.objects.Medal.onUnlockResponse","io/newgrounds/objects/Medal.hx",74,0x7fbeb13c)
HX_LOCAL_STACK_FRAME(_hx_pos_86dc0cd60a499658_90_sendDebugUnlock,"io.newgrounds.objects.Medal","sendDebugUnlock",0x547a0ea4,"io.newgrounds.objects.Medal.sendDebugUnlock","io/newgrounds/objects/Medal.hx",90,0x7fbeb13c)
HX_LOCAL_STACK_FRAME(_hx_pos_86dc0cd60a499658_104_get_difficultyName,"io.newgrounds.objects.Medal","get_difficultyName",0xdf354c7a,"io.newgrounds.objects.Medal.get_difficultyName","io/newgrounds/objects/Medal.hx",104,0x7fbeb13c)
HX_LOCAL_STACK_FRAME(_hx_pos_86dc0cd60a499658_109_toString,"io.newgrounds.objects.Medal","toString",0x590fca77,"io.newgrounds.objects.Medal.toString","io/newgrounds/objects/Medal.hx",109,0x7fbeb13c)
HX_LOCAL_STACK_FRAME(_hx_pos_86dc0cd60a499658_10_boot,"io.newgrounds.objects.Medal","boot",0x1592fc7d,"io.newgrounds.objects.Medal.boot","io/newgrounds/objects/Medal.hx",10,0x7fbeb13c)
HX_LOCAL_STACK_FRAME(_hx_pos_86dc0cd60a499658_11_boot,"io.newgrounds.objects.Medal","boot",0x1592fc7d,"io.newgrounds.objects.Medal.boot","io/newgrounds/objects/Medal.hx",11,0x7fbeb13c)
HX_LOCAL_STACK_FRAME(_hx_pos_86dc0cd60a499658_12_boot,"io.newgrounds.objects.Medal","boot",0x1592fc7d,"io.newgrounds.objects.Medal.boot","io/newgrounds/objects/Medal.hx",12,0x7fbeb13c)
HX_LOCAL_STACK_FRAME(_hx_pos_86dc0cd60a499658_13_boot,"io.newgrounds.objects.Medal","boot",0x1592fc7d,"io.newgrounds.objects.Medal.boot","io/newgrounds/objects/Medal.hx",13,0x7fbeb13c)
HX_LOCAL_STACK_FRAME(_hx_pos_86dc0cd60a499658_14_boot,"io.newgrounds.objects.Medal","boot",0x1592fc7d,"io.newgrounds.objects.Medal.boot","io/newgrounds/objects/Medal.hx",14,0x7fbeb13c)
HX_LOCAL_STACK_FRAME(_hx_pos_86dc0cd60a499658_17_boot,"io.newgrounds.objects.Medal","boot",0x1592fc7d,"io.newgrounds.objects.Medal.boot","io/newgrounds/objects/Medal.hx",17,0x7fbeb13c)
static const ::String _hx_array_data_e685cc03_13[] = {
	HX_("Easy",22,b8,e5,2d),HX_("Moderate",e3,cf,c7,aa),HX_("Challenging",40,14,ca,6e),HX_("Difficult",5e,00,a1,8e),HX_("Brutal",fa,42,ea,54),
};
namespace io{
namespace newgrounds{
namespace objects{

void Medal_obj::__construct( ::io::newgrounds::NGLite core, ::Dynamic data){
            	HX_GC_STACKFRAME(&_hx_pos_86dc0cd60a499658_37_new)
HXLINE(  39)		this->onUnlock =  ::io::newgrounds::utils::Dispatcher_obj::__alloc( HX_CTX );
HXLINE(  41)		super::__construct(core,data);
            	}

Dynamic Medal_obj::__CreateEmpty() { return new Medal_obj; }

void *Medal_obj::_hx_vtable = 0;

Dynamic Medal_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< Medal_obj > _hx_result = new Medal_obj();
	_hx_result->__construct(inArgs[0],inArgs[1]);
	return _hx_result;
}

bool Medal_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x1404d19d) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x1404d19d;
	} else {
		return inClassId==(int)0x7fb704e5;
	}
}

void Medal_obj::parse( ::Dynamic data){
            	HX_STACKFRAME(&_hx_pos_86dc0cd60a499658_45_parse)
HXLINE(  47)		bool wasLocked = !(this->unlocked);
HXLINE(  49)		this->id = ( (int)(data->__Field(HX_("id",db,5b,00,00),hx::paccDynamic)) );
HXLINE(  50)		this->name = ( (::String)(data->__Field(HX_("name",4b,72,ff,48),hx::paccDynamic)) );
HXLINE(  51)		this->description = ( (::String)(data->__Field(HX_("description",fc,08,1d,5f),hx::paccDynamic)) );
HXLINE(  52)		this->icon = ( (::String)(data->__Field(HX_("icon",79,e7,b2,45),hx::paccDynamic)) );
HXLINE(  53)		this->value = ( (int)(data->__Field(HX_("value",71,7f,b8,31),hx::paccDynamic)) );
HXLINE(  54)		this->difficulty = ( (int)(data->__Field(HX_("difficulty",3b,4e,8e,47),hx::paccDynamic)) );
HXLINE(  55)		this->secret = hx::IsEq(  ::Dynamic(data->__Field(HX_("secret",70,0e,4a,64),hx::paccDynamic)),(int)1 );
HXLINE(  56)		this->unlocked = ( (bool)(data->__Field(HX_("unlocked",23,34,0e,5c),hx::paccDynamic)) );
HXLINE(  58)		this->super::parse(data);
HXLINE(  60)		bool _hx_tmp;
HXDLIN(  60)		if (wasLocked) {
HXLINE(  60)			_hx_tmp = this->unlocked;
            		}
            		else {
HXLINE(  60)			_hx_tmp = false;
            		}
HXDLIN(  60)		if (_hx_tmp) {
HXLINE(  61)			this->onUnlock->dispatch();
            		}
            	}


void Medal_obj::sendUnlock(){
            	HX_STACKFRAME(&_hx_pos_86dc0cd60a499658_67_sendUnlock)
HXDLIN(  67)		this->_core->calls->medal->unlock(this->id)->addDataHandler(this->onUnlockResponse_dyn())->send();
            	}


HX_DEFINE_DYNAMIC_FUNC0(Medal_obj,sendUnlock,(void))

void Medal_obj::onUnlockResponse( ::io::newgrounds::objects::events::Response response){
            	HX_STACKFRAME(&_hx_pos_86dc0cd60a499658_74_onUnlockResponse)
HXDLIN(  74)		bool _hx_tmp;
HXDLIN(  74)		if (response->success) {
HXDLIN(  74)			_hx_tmp = response->result->success;
            		}
            		else {
HXDLIN(  74)			_hx_tmp = false;
            		}
HXDLIN(  74)		if (_hx_tmp) {
HXLINE(  76)			this->parse( ::Dynamic(response->result->data->__Field(HX_("medal",f7,fd,bb,05),hx::paccDynamic)));
HXLINE(  79)			if (!(this->unlocked)) {
HXLINE(  81)				this->unlocked = true;
HXLINE(  82)				this->onUnlock->dispatch();
            			}
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC1(Medal_obj,onUnlockResponse,(void))

void Medal_obj::sendDebugUnlock(){
            	HX_STACKFRAME(&_hx_pos_86dc0cd60a499658_90_sendDebugUnlock)
HXDLIN(  90)		if (hx::IsNull( ::io::newgrounds::NG_obj::core->sessionId )) {
HXLINE(  92)			this->onUnlock->dispatch();
            		}
            		else {
HXLINE(  96)			this->unlocked = false;
HXLINE(  98)			this->sendUnlock();
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC0(Medal_obj,sendDebugUnlock,(void))

::String Medal_obj::get_difficultyName(){
            	HX_STACKFRAME(&_hx_pos_86dc0cd60a499658_104_get_difficultyName)
HXDLIN( 104)		::Array< ::String > _hx_tmp = ::io::newgrounds::objects::Medal_obj::difficultyNames;
HXDLIN( 104)		return _hx_tmp->__get((this->difficulty - (int)1));
            	}


HX_DEFINE_DYNAMIC_FUNC0(Medal_obj,get_difficultyName,return )

::String Medal_obj::toString(){
            	HX_STACKFRAME(&_hx_pos_86dc0cd60a499658_109_toString)
HXDLIN( 109)		::String _hx_tmp;
HXDLIN( 109)		if (this->unlocked) {
HXDLIN( 109)			_hx_tmp = HX_("unlocked",23,34,0e,5c);
            		}
            		else {
HXDLIN( 109)			_hx_tmp = HX_("locked",0a,05,c7,59);
            		}
HXDLIN( 109)		::String _hx_tmp1 = ((((((((HX_("Medal: ",3d,04,82,b8) + this->id) + HX_("@",40,00,00,00)) + this->name) + HX_(" (",08,1c,00,00)) + _hx_tmp) + HX_(", ",74,26,00,00)) + this->value) + HX_(" pts, ",03,ae,50,95));
HXDLIN( 109)		return ((_hx_tmp1 + this->get_difficultyName()) + HX_(").",e5,23,00,00));
            	}


HX_DEFINE_DYNAMIC_FUNC0(Medal_obj,toString,return )

int Medal_obj::EASY;

int Medal_obj::MODERATE;

int Medal_obj::CHALLENGING;

int Medal_obj::DIFFICULT;

int Medal_obj::BRUTAL;

::Array< ::String > Medal_obj::difficultyNames;


hx::ObjectPtr< Medal_obj > Medal_obj::__new( ::io::newgrounds::NGLite core, ::Dynamic data) {
	hx::ObjectPtr< Medal_obj > __this = new Medal_obj();
	__this->__construct(core,data);
	return __this;
}

hx::ObjectPtr< Medal_obj > Medal_obj::__alloc(hx::Ctx *_hx_ctx, ::io::newgrounds::NGLite core, ::Dynamic data) {
	Medal_obj *__this = (Medal_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Medal_obj), true, "io.newgrounds.objects.Medal"));
	*(void **)__this = Medal_obj::_hx_vtable;
	__this->__construct(core,data);
	return __this;
}

Medal_obj::Medal_obj()
{
}

void Medal_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Medal);
	HX_MARK_MEMBER_NAME(id,"id");
	HX_MARK_MEMBER_NAME(name,"name");
	HX_MARK_MEMBER_NAME(description,"description");
	HX_MARK_MEMBER_NAME(icon,"icon");
	HX_MARK_MEMBER_NAME(value,"value");
	HX_MARK_MEMBER_NAME(difficulty,"difficulty");
	HX_MARK_MEMBER_NAME(secret,"secret");
	HX_MARK_MEMBER_NAME(unlocked,"unlocked");
	HX_MARK_MEMBER_NAME(onUnlock,"onUnlock");
	 ::io::newgrounds::objects::Object_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void Medal_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(id,"id");
	HX_VISIT_MEMBER_NAME(name,"name");
	HX_VISIT_MEMBER_NAME(description,"description");
	HX_VISIT_MEMBER_NAME(icon,"icon");
	HX_VISIT_MEMBER_NAME(value,"value");
	HX_VISIT_MEMBER_NAME(difficulty,"difficulty");
	HX_VISIT_MEMBER_NAME(secret,"secret");
	HX_VISIT_MEMBER_NAME(unlocked,"unlocked");
	HX_VISIT_MEMBER_NAME(onUnlock,"onUnlock");
	 ::io::newgrounds::objects::Object_obj::__Visit(HX_VISIT_ARG);
}

hx::Val Medal_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"id") ) { return hx::Val( id ); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"name") ) { return hx::Val( name ); }
		if (HX_FIELD_EQ(inName,"icon") ) { return hx::Val( icon ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"value") ) { return hx::Val( value ); }
		if (HX_FIELD_EQ(inName,"parse") ) { return hx::Val( parse_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"secret") ) { return hx::Val( secret ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"unlocked") ) { return hx::Val( unlocked ); }
		if (HX_FIELD_EQ(inName,"onUnlock") ) { return hx::Val( onUnlock ); }
		if (HX_FIELD_EQ(inName,"toString") ) { return hx::Val( toString_dyn() ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"difficulty") ) { return hx::Val( difficulty ); }
		if (HX_FIELD_EQ(inName,"sendUnlock") ) { return hx::Val( sendUnlock_dyn() ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"description") ) { return hx::Val( description ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"difficultyName") ) { if (inCallProp == hx::paccAlways) return hx::Val( get_difficultyName() ); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"sendDebugUnlock") ) { return hx::Val( sendDebugUnlock_dyn() ); }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"onUnlockResponse") ) { return hx::Val( onUnlockResponse_dyn() ); }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"get_difficultyName") ) { return hx::Val( get_difficultyName_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

bool Medal_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 15:
		if (HX_FIELD_EQ(inName,"difficultyNames") ) { outValue = ( difficultyNames ); return true; }
	}
	return false;
}

hx::Val Medal_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"id") ) { id=inValue.Cast< int >(); return inValue; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"name") ) { name=inValue.Cast< ::String >(); return inValue; }
		if (HX_FIELD_EQ(inName,"icon") ) { icon=inValue.Cast< ::String >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"value") ) { value=inValue.Cast< int >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"secret") ) { secret=inValue.Cast< bool >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"unlocked") ) { unlocked=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"onUnlock") ) { onUnlock=inValue.Cast<  ::io::newgrounds::utils::Dispatcher >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"difficulty") ) { difficulty=inValue.Cast< int >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"description") ) { description=inValue.Cast< ::String >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

bool Medal_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 15:
		if (HX_FIELD_EQ(inName,"difficultyNames") ) { difficultyNames=ioValue.Cast< ::Array< ::String > >(); return true; }
	}
	return false;
}

void Medal_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("id","\xdb","\x5b","\x00","\x00"));
	outFields->push(HX_HCSTRING("name","\x4b","\x72","\xff","\x48"));
	outFields->push(HX_HCSTRING("description","\xfc","\x08","\x1d","\x5f"));
	outFields->push(HX_HCSTRING("icon","\x79","\xe7","\xb2","\x45"));
	outFields->push(HX_HCSTRING("value","\x71","\x7f","\xb8","\x31"));
	outFields->push(HX_HCSTRING("difficulty","\x3b","\x4e","\x8e","\x47"));
	outFields->push(HX_HCSTRING("secret","\x70","\x0e","\x4a","\x64"));
	outFields->push(HX_HCSTRING("unlocked","\x23","\x34","\x0e","\x5c"));
	outFields->push(HX_HCSTRING("difficultyName","\x26","\x26","\x4a","\x94"));
	outFields->push(HX_HCSTRING("onUnlock","\x43","\x99","\x39","\x45"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo Medal_obj_sMemberStorageInfo[] = {
	{hx::fsInt,(int)offsetof(Medal_obj,id),HX_HCSTRING("id","\xdb","\x5b","\x00","\x00")},
	{hx::fsString,(int)offsetof(Medal_obj,name),HX_HCSTRING("name","\x4b","\x72","\xff","\x48")},
	{hx::fsString,(int)offsetof(Medal_obj,description),HX_HCSTRING("description","\xfc","\x08","\x1d","\x5f")},
	{hx::fsString,(int)offsetof(Medal_obj,icon),HX_HCSTRING("icon","\x79","\xe7","\xb2","\x45")},
	{hx::fsInt,(int)offsetof(Medal_obj,value),HX_HCSTRING("value","\x71","\x7f","\xb8","\x31")},
	{hx::fsInt,(int)offsetof(Medal_obj,difficulty),HX_HCSTRING("difficulty","\x3b","\x4e","\x8e","\x47")},
	{hx::fsBool,(int)offsetof(Medal_obj,secret),HX_HCSTRING("secret","\x70","\x0e","\x4a","\x64")},
	{hx::fsBool,(int)offsetof(Medal_obj,unlocked),HX_HCSTRING("unlocked","\x23","\x34","\x0e","\x5c")},
	{hx::fsObject /*::io::newgrounds::utils::Dispatcher*/ ,(int)offsetof(Medal_obj,onUnlock),HX_HCSTRING("onUnlock","\x43","\x99","\x39","\x45")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo Medal_obj_sStaticStorageInfo[] = {
	{hx::fsInt,(void *) &Medal_obj::EASY,HX_HCSTRING("EASY","\x02","\x54","\xcd","\x2d")},
	{hx::fsInt,(void *) &Medal_obj::MODERATE,HX_HCSTRING("MODERATE","\xc3","\xa3","\x9b","\x2a")},
	{hx::fsInt,(void *) &Medal_obj::CHALLENGING,HX_HCSTRING("CHALLENGING","\x40","\x88","\xd3","\x60")},
	{hx::fsInt,(void *) &Medal_obj::DIFFICULT,HX_HCSTRING("DIFFICULT","\x5e","\x90","\x26","\xe8")},
	{hx::fsInt,(void *) &Medal_obj::BRUTAL,HX_HCSTRING("BRUTAL","\xda","\x7a","\xd8","\xd2")},
	{hx::fsObject /*Array< ::String >*/ ,(void *) &Medal_obj::difficultyNames,HX_HCSTRING("difficultyNames","\x8d","\x3b","\x97","\x2c")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static ::String Medal_obj_sMemberFields[] = {
	HX_HCSTRING("id","\xdb","\x5b","\x00","\x00"),
	HX_HCSTRING("name","\x4b","\x72","\xff","\x48"),
	HX_HCSTRING("description","\xfc","\x08","\x1d","\x5f"),
	HX_HCSTRING("icon","\x79","\xe7","\xb2","\x45"),
	HX_HCSTRING("value","\x71","\x7f","\xb8","\x31"),
	HX_HCSTRING("difficulty","\x3b","\x4e","\x8e","\x47"),
	HX_HCSTRING("secret","\x70","\x0e","\x4a","\x64"),
	HX_HCSTRING("unlocked","\x23","\x34","\x0e","\x5c"),
	HX_HCSTRING("onUnlock","\x43","\x99","\x39","\x45"),
	HX_HCSTRING("parse","\x33","\x90","\x55","\xbd"),
	HX_HCSTRING("sendUnlock","\x2c","\xca","\xe2","\x06"),
	HX_HCSTRING("onUnlockResponse","\xe4","\x7e","\xe7","\x9e"),
	HX_HCSTRING("sendDebugUnlock","\x0f","\x69","\x19","\xb5"),
	HX_HCSTRING("get_difficultyName","\xef","\x06","\xe4","\x2f"),
	HX_HCSTRING("toString","\xac","\xd0","\x6e","\x38"),
	::String(null()) };

static void Medal_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Medal_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(Medal_obj::EASY,"EASY");
	HX_MARK_MEMBER_NAME(Medal_obj::MODERATE,"MODERATE");
	HX_MARK_MEMBER_NAME(Medal_obj::CHALLENGING,"CHALLENGING");
	HX_MARK_MEMBER_NAME(Medal_obj::DIFFICULT,"DIFFICULT");
	HX_MARK_MEMBER_NAME(Medal_obj::BRUTAL,"BRUTAL");
	HX_MARK_MEMBER_NAME(Medal_obj::difficultyNames,"difficultyNames");
};

#ifdef HXCPP_VISIT_ALLOCS
static void Medal_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Medal_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(Medal_obj::EASY,"EASY");
	HX_VISIT_MEMBER_NAME(Medal_obj::MODERATE,"MODERATE");
	HX_VISIT_MEMBER_NAME(Medal_obj::CHALLENGING,"CHALLENGING");
	HX_VISIT_MEMBER_NAME(Medal_obj::DIFFICULT,"DIFFICULT");
	HX_VISIT_MEMBER_NAME(Medal_obj::BRUTAL,"BRUTAL");
	HX_VISIT_MEMBER_NAME(Medal_obj::difficultyNames,"difficultyNames");
};

#endif

hx::Class Medal_obj::__mClass;

static ::String Medal_obj_sStaticFields[] = {
	HX_HCSTRING("EASY","\x02","\x54","\xcd","\x2d"),
	HX_HCSTRING("MODERATE","\xc3","\xa3","\x9b","\x2a"),
	HX_HCSTRING("CHALLENGING","\x40","\x88","\xd3","\x60"),
	HX_HCSTRING("DIFFICULT","\x5e","\x90","\x26","\xe8"),
	HX_HCSTRING("BRUTAL","\xda","\x7a","\xd8","\xd2"),
	HX_HCSTRING("difficultyNames","\x8d","\x3b","\x97","\x2c"),
	::String(null())
};

void Medal_obj::__register()
{
	hx::Object *dummy = new Medal_obj;
	Medal_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("io.newgrounds.objects.Medal","\x03","\xcc","\x85","\xe6");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &Medal_obj::__GetStatic;
	__mClass->mSetStaticField = &Medal_obj::__SetStatic;
	__mClass->mMarkFunc = Medal_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(Medal_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(Medal_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< Medal_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = Medal_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Medal_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Medal_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void Medal_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_86dc0cd60a499658_10_boot)
HXDLIN(  10)		EASY = (int)1;
            	}
{
            	HX_STACKFRAME(&_hx_pos_86dc0cd60a499658_11_boot)
HXDLIN(  11)		MODERATE = (int)2;
            	}
{
            	HX_STACKFRAME(&_hx_pos_86dc0cd60a499658_12_boot)
HXDLIN(  12)		CHALLENGING = (int)3;
            	}
{
            	HX_STACKFRAME(&_hx_pos_86dc0cd60a499658_13_boot)
HXDLIN(  13)		DIFFICULT = (int)4;
            	}
{
            	HX_STACKFRAME(&_hx_pos_86dc0cd60a499658_14_boot)
HXDLIN(  14)		BRUTAL = (int)5;
            	}
{
            	HX_STACKFRAME(&_hx_pos_86dc0cd60a499658_17_boot)
HXDLIN(  17)		difficultyNames = ::Array_obj< ::String >::fromData( _hx_array_data_e685cc03_13,5);
            	}
}

} // end namespace io
} // end namespace newgrounds
} // end namespace objects
