// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_Reflect
#include <Reflect.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_haxe_IMap
#include <haxe/IMap.h>
#endif
#ifndef INCLUDED_haxe_Log
#include <haxe/Log.h>
#endif
#ifndef INCLUDED_haxe_crypto_BaseCode
#include <haxe/crypto/BaseCode.h>
#endif
#ifndef INCLUDED_haxe_ds_StringMap
#include <haxe/ds/StringMap.h>
#endif
#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_haxe_zip_Uncompress
#include <haxe/zip/Uncompress.h>
#endif
#ifndef INCLUDED_openfl__legacy_Lib
#include <openfl/_legacy/Lib.h>
#endif
#ifndef INCLUDED_openfl__legacy_utils_JNI
#include <openfl/_legacy/utils/JNI.h>
#endif
#ifndef INCLUDED_openfl__legacy_utils_JNIMemberField
#include <openfl/_legacy/utils/JNIMemberField.h>
#endif
#ifndef INCLUDED_openfl__legacy_utils_JNIMethod
#include <openfl/_legacy/utils/JNIMethod.h>
#endif
#ifndef INCLUDED_openfl__legacy_utils_JNIStaticField
#include <openfl/_legacy/utils/JNIStaticField.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_21_callMember,"openfl._legacy.utils.JNI","callMember",0xddc3f3e2,"openfl._legacy.utils.JNI.callMember","openfl/_legacy/utils/JNI.hx",21,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_40_callStatic,"openfl._legacy.utils.JNI","callStatic",0xdf09ee36,"openfl._legacy.utils.JNI.callStatic","openfl/_legacy/utils/JNI.hx",40,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_57_createInterface,"openfl._legacy.utils.JNI","createInterface",0x71872493,"openfl._legacy.utils.JNI.createInterface","openfl/_legacy/utils/JNI.hx",57,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_75_createMemberField,"openfl._legacy.utils.JNI","createMemberField",0x3589395a,"openfl._legacy.utils.JNI.createMemberField","openfl/_legacy/utils/JNI.hx",75,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_84_createMemberMethod,"openfl._legacy.utils.JNI","createMemberMethod",0x2b555e41,"openfl._legacy.utils.JNI.createMemberMethod","openfl/_legacy/utils/JNI.hx",84,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_109_createStaticField,"openfl._legacy.utils.JNI","createStaticField",0x48534e86,"openfl._legacy.utils.JNI.createStaticField","openfl/_legacy/utils/JNI.hx",109,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_118_createStaticMethod,"openfl._legacy.utils.JNI","createStaticMethod",0x895dcf95,"openfl._legacy.utils.JNI.createStaticMethod","openfl/_legacy/utils/JNI.hx",118,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_143_getEnv,"openfl._legacy.utils.JNI","getEnv",0xfa690a41,"openfl._legacy.utils.JNI.getEnv","openfl/_legacy/utils/JNI.hx",143,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_154_init,"openfl._legacy.utils.JNI","init",0xa26141da,"openfl._legacy.utils.JNI.init","openfl/_legacy/utils/JNI.hx",154,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_165_onCallback,"openfl._legacy.utils.JNI","onCallback",0x0a9ba84e,"openfl._legacy.utils.JNI.onCallback","openfl/_legacy/utils/JNI.hx",165,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_14_boot,"openfl._legacy.utils.JNI","boot",0x9dc18afc,"openfl._legacy.utils.JNI.boot","openfl/_legacy/utils/JNI.hx",14,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_15_boot,"openfl._legacy.utils.JNI","boot",0x9dc18afc,"openfl._legacy.utils.JNI.boot","openfl/_legacy/utils/JNI.hx",15,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_16_boot,"openfl._legacy.utils.JNI","boot",0x9dc18afc,"openfl._legacy.utils.JNI.boot","openfl/_legacy/utils/JNI.hx",16,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_188_boot,"openfl._legacy.utils.JNI","boot",0x9dc18afc,"openfl._legacy.utils.JNI.boot","openfl/_legacy/utils/JNI.hx",188,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_189_boot,"openfl._legacy.utils.JNI","boot",0x9dc18afc,"openfl._legacy.utils.JNI.boot","openfl/_legacy/utils/JNI.hx",189,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_190_boot,"openfl._legacy.utils.JNI","boot",0x9dc18afc,"openfl._legacy.utils.JNI.boot","openfl/_legacy/utils/JNI.hx",190,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_191_boot,"openfl._legacy.utils.JNI","boot",0x9dc18afc,"openfl._legacy.utils.JNI.boot","openfl/_legacy/utils/JNI.hx",191,0x5c37961d)
HX_LOCAL_STACK_FRAME(_hx_pos_f7be42698d705636_192_boot,"openfl._legacy.utils.JNI","boot",0x9dc18afc,"openfl._legacy.utils.JNI.boot","openfl/_legacy/utils/JNI.hx",192,0x5c37961d)
namespace openfl{
namespace _legacy{
namespace utils{

void JNI_obj::__construct() { }

Dynamic JNI_obj::__CreateEmpty() { return new JNI_obj; }

void *JNI_obj::_hx_vtable = 0;

Dynamic JNI_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< JNI_obj > _hx_result = new JNI_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool JNI_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x0fc600e8;
}

 ::haxe::ds::StringMap JNI_obj::alreadyCreated;

::String JNI_obj::base64;

bool JNI_obj::initialized;

 ::Dynamic JNI_obj::callMember( ::Dynamic method, ::Dynamic jobject,::cpp::VirtualArray a){
            	HX_STACKFRAME(&_hx_pos_f7be42698d705636_21_callMember)
HXDLIN(  21)		int _g = a->get_length();
HXDLIN(  21)		switch((int)(_g)){
            			case (int)0: {
HXLINE(  23)				return method(jobject);
            			}
            			break;
            			case (int)1: {
HXLINE(  24)				return method(jobject,a->__get((int)0));
            			}
            			break;
            			case (int)2: {
HXLINE(  25)				return method(jobject,a->__get((int)0),a->__get((int)1));
            			}
            			break;
            			case (int)3: {
HXLINE(  26)				return method(jobject,a->__get((int)0),a->__get((int)1),a->__get((int)2));
            			}
            			break;
            			case (int)4: {
HXLINE(  27)				return method(jobject,a->__get((int)0),a->__get((int)1),a->__get((int)2),a->__get((int)3));
            			}
            			break;
            			case (int)5: {
HXLINE(  28)				return method(jobject,a->__get((int)0),a->__get((int)1),a->__get((int)2),a->__get((int)3),a->__get((int)4));
            			}
            			break;
            			case (int)6: {
HXLINE(  29)				return method(jobject,a->__get((int)0),a->__get((int)1),a->__get((int)2),a->__get((int)3),a->__get((int)4),a->__get((int)5));
            			}
            			break;
            			case (int)7: {
HXLINE(  30)				return method(jobject,a->__get((int)0),a->__get((int)1),a->__get((int)2),a->__get((int)3),a->__get((int)4),a->__get((int)5),a->__get((int)6));
            			}
            			break;
            			default:{
HXLINE(  31)				return null();
            			}
            		}
HXLINE(  21)		return null();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(JNI_obj,callMember,return )

 ::Dynamic JNI_obj::callStatic( ::Dynamic method,::cpp::VirtualArray a){
            	HX_STACKFRAME(&_hx_pos_f7be42698d705636_40_callStatic)
HXDLIN(  40)		int _g = a->get_length();
HXDLIN(  40)		switch((int)(_g)){
            			case (int)0: {
HXLINE(  42)				return method();
            			}
            			break;
            			case (int)1: {
HXLINE(  43)				return method(a->__get((int)0));
            			}
            			break;
            			case (int)2: {
HXLINE(  44)				return method(a->__get((int)0),a->__get((int)1));
            			}
            			break;
            			case (int)3: {
HXLINE(  45)				return method(a->__get((int)0),a->__get((int)1),a->__get((int)2));
            			}
            			break;
            			case (int)4: {
HXLINE(  46)				return method(a->__get((int)0),a->__get((int)1),a->__get((int)2),a->__get((int)3));
            			}
            			break;
            			case (int)5: {
HXLINE(  47)				return method(a->__get((int)0),a->__get((int)1),a->__get((int)2),a->__get((int)3),a->__get((int)4));
            			}
            			break;
            			case (int)6: {
HXLINE(  48)				return method(a->__get((int)0),a->__get((int)1),a->__get((int)2),a->__get((int)3),a->__get((int)4),a->__get((int)5));
            			}
            			break;
            			case (int)7: {
HXLINE(  49)				return method(a->__get((int)0),a->__get((int)1),a->__get((int)2),a->__get((int)3),a->__get((int)4),a->__get((int)5),a->__get((int)6));
            			}
            			break;
            			default:{
HXLINE(  50)				return null();
            			}
            		}
HXLINE(  40)		return null();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(JNI_obj,callStatic,return )

 ::Dynamic JNI_obj::createInterface( ::Dynamic haxeClass,::String className,::String classDef){
            	HX_STACKFRAME(&_hx_pos_f7be42698d705636_57_createInterface)
HXLINE(  59)		 ::haxe::io::Bytes bytes = null();
HXLINE(  61)		if (!(( (bool)(::openfl::_legacy::utils::JNI_obj::alreadyCreated->get(className)) ))) {
HXLINE(  63)			bytes = ::haxe::io::Bytes_obj::ofString(::haxe::crypto::BaseCode_obj::decode(classDef,::openfl::_legacy::utils::JNI_obj::base64));
HXLINE(  64)			bytes = ::haxe::zip::Uncompress_obj::run(bytes,(int)9);
HXLINE(  65)			::openfl::_legacy::utils::JNI_obj::alreadyCreated->set(className,true);
            		}
HXLINE(  69)		return null();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(JNI_obj,createInterface,return )

 ::openfl::_legacy::utils::JNIMemberField JNI_obj::createMemberField(::String className,::String memberName,::String signature){
            	HX_GC_STACKFRAME(&_hx_pos_f7be42698d705636_75_createMemberField)
HXLINE(  77)		::openfl::_legacy::utils::JNI_obj::init();
HXLINE(  79)		return  ::openfl::_legacy::utils::JNIMemberField_obj::__alloc( HX_CTX ,::openfl::_legacy::utils::JNI_obj::lime_jni_create_field(className,memberName,signature,false));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(JNI_obj,createMemberField,return )

 ::Dynamic JNI_obj::createMemberMethod(::String className,::String memberName,::String signature,hx::Null< bool >  __o_useArray,hx::Null< bool >  __o_quietFail){
bool useArray = __o_useArray.Default(false);
bool quietFail = __o_quietFail.Default(false);
            	HX_GC_STACKFRAME(&_hx_pos_f7be42698d705636_84_createMemberMethod)
HXLINE(  86)		::openfl::_legacy::utils::JNI_obj::init();
HXLINE(  88)		className = className.split(HX_(".",2e,00,00,00))->join(HX_("/",2f,00,00,00));
HXLINE(  89)		 ::Dynamic handle = ::openfl::_legacy::utils::JNI_obj::lime_jni_create_method(className,memberName,signature,false,quietFail);
HXLINE(  91)		if (hx::IsNull( handle )) {
HXLINE(  93)			if (quietFail) {
HXLINE(  95)				return null();
            			}
HXLINE(  99)			HX_STACK_DO_THROW(((HX_("Could not find member function \"",c5,79,42,b4) + memberName) + HX_("\"",22,00,00,00)));
            		}
HXLINE( 103)		 ::openfl::_legacy::utils::JNIMethod method =  ::openfl::_legacy::utils::JNIMethod_obj::__alloc( HX_CTX ,handle);
HXLINE( 104)		return method->getMemberMethod(useArray);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC5(JNI_obj,createMemberMethod,return )

 ::openfl::_legacy::utils::JNIStaticField JNI_obj::createStaticField(::String className,::String memberName,::String signature){
            	HX_GC_STACKFRAME(&_hx_pos_f7be42698d705636_109_createStaticField)
HXLINE( 111)		::openfl::_legacy::utils::JNI_obj::init();
HXLINE( 113)		return  ::openfl::_legacy::utils::JNIStaticField_obj::__alloc( HX_CTX ,::openfl::_legacy::utils::JNI_obj::lime_jni_create_field(className,memberName,signature,true));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(JNI_obj,createStaticField,return )

 ::Dynamic JNI_obj::createStaticMethod(::String className,::String memberName,::String signature,hx::Null< bool >  __o_useArray,hx::Null< bool >  __o_quietFail){
bool useArray = __o_useArray.Default(false);
bool quietFail = __o_quietFail.Default(false);
            	HX_GC_STACKFRAME(&_hx_pos_f7be42698d705636_118_createStaticMethod)
HXLINE( 120)		::openfl::_legacy::utils::JNI_obj::init();
HXLINE( 122)		className = className.split(HX_(".",2e,00,00,00))->join(HX_("/",2f,00,00,00));
HXLINE( 123)		 ::Dynamic handle = ::openfl::_legacy::utils::JNI_obj::lime_jni_create_method(className,memberName,signature,true,quietFail);
HXLINE( 125)		if (hx::IsNull( handle )) {
HXLINE( 127)			if (quietFail) {
HXLINE( 129)				return null();
            			}
HXLINE( 133)			HX_STACK_DO_THROW(((HX_("Could not find static function \"",f1,b7,fa,62) + memberName) + HX_("\"",22,00,00,00)));
            		}
HXLINE( 137)		 ::openfl::_legacy::utils::JNIMethod method =  ::openfl::_legacy::utils::JNIMethod_obj::__alloc( HX_CTX ,handle);
HXLINE( 138)		return method->getStaticMethod(useArray);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC5(JNI_obj,createStaticMethod,return )

 ::Dynamic JNI_obj::getEnv(){
            	HX_STACKFRAME(&_hx_pos_f7be42698d705636_143_getEnv)
HXLINE( 145)		::openfl::_legacy::utils::JNI_obj::init();
HXLINE( 147)		return ::openfl::_legacy::utils::JNI_obj::lime_jni_get_env();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(JNI_obj,getEnv,return )

void JNI_obj::init(){
            	HX_STACKFRAME(&_hx_pos_f7be42698d705636_154_init)
HXDLIN( 154)		if (!(::openfl::_legacy::utils::JNI_obj::initialized)) {
HXLINE( 156)			::openfl::_legacy::utils::JNI_obj::initialized = true;
HXLINE( 157)			 ::Dynamic method = ::openfl::_legacy::Lib_obj::load(HX_("lime-legacy",c1,7f,b9,87),HX_("lime_legacy_jni_init_callback",2e,39,57,95),(int)1);
HXLINE( 158)			method(::openfl::_legacy::utils::JNI_obj::onCallback_dyn());
            		}
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(JNI_obj,init,(void))

 ::Dynamic JNI_obj::onCallback( ::Dynamic object, ::Dynamic method, ::Dynamic args){
            	HX_STACKFRAME(&_hx_pos_f7be42698d705636_165_onCallback)
HXLINE( 167)		 ::Dynamic field = ::Reflect_obj::field(object,( (::String)(method) ));
HXLINE( 169)		if (hx::IsNotNull( field )) {
HXLINE( 171)			return ::Reflect_obj::callMethod(object,field,( (::cpp::VirtualArray)(args) ));
            		}
HXLINE( 175)		 ::Dynamic _hx_tmp = ::haxe::Log_obj::trace;
HXDLIN( 175)		::String _hx_tmp1 = (HX_("onCallback - unknown field ",2b,28,2a,3c) + ::Std_obj::string(method));
HXDLIN( 175)		_hx_tmp(_hx_tmp1,hx::SourceInfo(HX_("JNI.hx",d9,c8,0d,b0),175,HX_("openfl._legacy.utils.JNI",e4,cd,bf,3d),HX_("onCallback",04,6e,bd,5c)));
HXLINE( 176)		return null();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(JNI_obj,onCallback,return )

 ::Dynamic JNI_obj::lime_jni_create_field;

 ::Dynamic JNI_obj::lime_jni_create_method;

 ::Dynamic JNI_obj::lime_jni_get_env;

 ::Dynamic JNI_obj::lime_jni_call_member;

 ::Dynamic JNI_obj::lime_jni_call_static;


JNI_obj::JNI_obj()
{
}

bool JNI_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"init") ) { outValue = init_dyn(); return true; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"base64") ) { outValue = ( base64 ); return true; }
		if (HX_FIELD_EQ(inName,"getEnv") ) { outValue = getEnv_dyn(); return true; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"callMember") ) { outValue = callMember_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"callStatic") ) { outValue = callStatic_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"onCallback") ) { outValue = onCallback_dyn(); return true; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"initialized") ) { outValue = ( initialized ); return true; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"alreadyCreated") ) { outValue = ( alreadyCreated ); return true; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"createInterface") ) { outValue = createInterface_dyn(); return true; }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"lime_jni_get_env") ) { outValue = ( lime_jni_get_env ); return true; }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"createMemberField") ) { outValue = createMemberField_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"createStaticField") ) { outValue = createStaticField_dyn(); return true; }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"createMemberMethod") ) { outValue = createMemberMethod_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"createStaticMethod") ) { outValue = createStaticMethod_dyn(); return true; }
		break;
	case 20:
		if (HX_FIELD_EQ(inName,"lime_jni_call_member") ) { outValue = ( lime_jni_call_member ); return true; }
		if (HX_FIELD_EQ(inName,"lime_jni_call_static") ) { outValue = ( lime_jni_call_static ); return true; }
		break;
	case 21:
		if (HX_FIELD_EQ(inName,"lime_jni_create_field") ) { outValue = ( lime_jni_create_field ); return true; }
		break;
	case 22:
		if (HX_FIELD_EQ(inName,"lime_jni_create_method") ) { outValue = ( lime_jni_create_method ); return true; }
	}
	return false;
}

bool JNI_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"base64") ) { base64=ioValue.Cast< ::String >(); return true; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"initialized") ) { initialized=ioValue.Cast< bool >(); return true; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"alreadyCreated") ) { alreadyCreated=ioValue.Cast<  ::haxe::ds::StringMap >(); return true; }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"lime_jni_get_env") ) { lime_jni_get_env=ioValue.Cast<  ::Dynamic >(); return true; }
		break;
	case 20:
		if (HX_FIELD_EQ(inName,"lime_jni_call_member") ) { lime_jni_call_member=ioValue.Cast<  ::Dynamic >(); return true; }
		if (HX_FIELD_EQ(inName,"lime_jni_call_static") ) { lime_jni_call_static=ioValue.Cast<  ::Dynamic >(); return true; }
		break;
	case 21:
		if (HX_FIELD_EQ(inName,"lime_jni_create_field") ) { lime_jni_create_field=ioValue.Cast<  ::Dynamic >(); return true; }
		break;
	case 22:
		if (HX_FIELD_EQ(inName,"lime_jni_create_method") ) { lime_jni_create_method=ioValue.Cast<  ::Dynamic >(); return true; }
	}
	return false;
}

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *JNI_obj_sMemberStorageInfo = 0;
static hx::StaticInfo JNI_obj_sStaticStorageInfo[] = {
	{hx::fsObject /*::haxe::ds::StringMap*/ ,(void *) &JNI_obj::alreadyCreated,HX_HCSTRING("alreadyCreated","\x30","\xe9","\xf8","\x79")},
	{hx::fsString,(void *) &JNI_obj::base64,HX_HCSTRING("base64","\x8f","\xfd","\x27","\x55")},
	{hx::fsBool,(void *) &JNI_obj::initialized,HX_HCSTRING("initialized","\x14","\xf5","\x0f","\x37")},
	{hx::fsObject /*Dynamic*/ ,(void *) &JNI_obj::lime_jni_create_field,HX_HCSTRING("lime_jni_create_field","\x3b","\xa8","\xe1","\x17")},
	{hx::fsObject /*Dynamic*/ ,(void *) &JNI_obj::lime_jni_create_method,HX_HCSTRING("lime_jni_create_method","\x40","\xf4","\x5d","\x56")},
	{hx::fsObject /*Dynamic*/ ,(void *) &JNI_obj::lime_jni_get_env,HX_HCSTRING("lime_jni_get_env","\xc0","\xb2","\xe3","\xd3")},
	{hx::fsObject /*Dynamic*/ ,(void *) &JNI_obj::lime_jni_call_member,HX_HCSTRING("lime_jni_call_member","\x57","\xff","\x9f","\x4b")},
	{hx::fsObject /*Dynamic*/ ,(void *) &JNI_obj::lime_jni_call_static,HX_HCSTRING("lime_jni_call_static","\xab","\xf9","\xe5","\x4c")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static void JNI_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(JNI_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(JNI_obj::alreadyCreated,"alreadyCreated");
	HX_MARK_MEMBER_NAME(JNI_obj::base64,"base64");
	HX_MARK_MEMBER_NAME(JNI_obj::initialized,"initialized");
	HX_MARK_MEMBER_NAME(JNI_obj::lime_jni_create_field,"lime_jni_create_field");
	HX_MARK_MEMBER_NAME(JNI_obj::lime_jni_create_method,"lime_jni_create_method");
	HX_MARK_MEMBER_NAME(JNI_obj::lime_jni_get_env,"lime_jni_get_env");
	HX_MARK_MEMBER_NAME(JNI_obj::lime_jni_call_member,"lime_jni_call_member");
	HX_MARK_MEMBER_NAME(JNI_obj::lime_jni_call_static,"lime_jni_call_static");
};

#ifdef HXCPP_VISIT_ALLOCS
static void JNI_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(JNI_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(JNI_obj::alreadyCreated,"alreadyCreated");
	HX_VISIT_MEMBER_NAME(JNI_obj::base64,"base64");
	HX_VISIT_MEMBER_NAME(JNI_obj::initialized,"initialized");
	HX_VISIT_MEMBER_NAME(JNI_obj::lime_jni_create_field,"lime_jni_create_field");
	HX_VISIT_MEMBER_NAME(JNI_obj::lime_jni_create_method,"lime_jni_create_method");
	HX_VISIT_MEMBER_NAME(JNI_obj::lime_jni_get_env,"lime_jni_get_env");
	HX_VISIT_MEMBER_NAME(JNI_obj::lime_jni_call_member,"lime_jni_call_member");
	HX_VISIT_MEMBER_NAME(JNI_obj::lime_jni_call_static,"lime_jni_call_static");
};

#endif

hx::Class JNI_obj::__mClass;

static ::String JNI_obj_sStaticFields[] = {
	HX_HCSTRING("alreadyCreated","\x30","\xe9","\xf8","\x79"),
	HX_HCSTRING("base64","\x8f","\xfd","\x27","\x55"),
	HX_HCSTRING("initialized","\x14","\xf5","\x0f","\x37"),
	HX_HCSTRING("callMember","\x98","\xb9","\xe5","\x2f"),
	HX_HCSTRING("callStatic","\xec","\xb3","\x2b","\x31"),
	HX_HCSTRING("createInterface","\x1d","\xeb","\xce","\xda"),
	HX_HCSTRING("createMemberField","\x64","\x36","\x37","\x55"),
	HX_HCSTRING("createMemberMethod","\xf7","\xc9","\xe4","\xc3"),
	HX_HCSTRING("createStaticField","\x90","\x4b","\x01","\x68"),
	HX_HCSTRING("createStaticMethod","\x4b","\x3b","\xed","\x21"),
	HX_HCSTRING("getEnv","\xf7","\x3c","\x1c","\xa3"),
	HX_HCSTRING("init","\x10","\x3b","\xbb","\x45"),
	HX_HCSTRING("onCallback","\x04","\x6e","\xbd","\x5c"),
	HX_HCSTRING("lime_jni_create_field","\x3b","\xa8","\xe1","\x17"),
	HX_HCSTRING("lime_jni_create_method","\x40","\xf4","\x5d","\x56"),
	HX_HCSTRING("lime_jni_get_env","\xc0","\xb2","\xe3","\xd3"),
	HX_HCSTRING("lime_jni_call_member","\x57","\xff","\x9f","\x4b"),
	HX_HCSTRING("lime_jni_call_static","\xab","\xf9","\xe5","\x4c"),
	::String(null())
};

void JNI_obj::__register()
{
	hx::Object *dummy = new JNI_obj;
	JNI_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("openfl._legacy.utils.JNI","\xe4","\xcd","\xbf","\x3d");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &JNI_obj::__GetStatic;
	__mClass->mSetStaticField = &JNI_obj::__SetStatic;
	__mClass->mMarkFunc = JNI_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(JNI_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = hx::TCanCast< JNI_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = JNI_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = JNI_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = JNI_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void JNI_obj::__boot()
{
{
            	HX_GC_STACKFRAME(&_hx_pos_f7be42698d705636_14_boot)
HXDLIN(  14)		alreadyCreated =  ::haxe::ds::StringMap_obj::__alloc( HX_CTX );
            	}
{
            	HX_STACKFRAME(&_hx_pos_f7be42698d705636_15_boot)
HXDLIN(  15)		base64 = HX_("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",03,41,03,7f);
            	}
{
            	HX_STACKFRAME(&_hx_pos_f7be42698d705636_16_boot)
HXDLIN(  16)		initialized = false;
            	}
{
            	HX_STACKFRAME(&_hx_pos_f7be42698d705636_188_boot)
HXDLIN( 188)		lime_jni_create_field = ::openfl::_legacy::Lib_obj::load(HX_("lime-legacy",c1,7f,b9,87),HX_("lime_legacy_jni_create_field",1d,84,2e,09),(int)4);
            	}
{
            	HX_STACKFRAME(&_hx_pos_f7be42698d705636_189_boot)
HXDLIN( 189)		lime_jni_create_method = ::openfl::_legacy::Lib_obj::load(HX_("lime-legacy",c1,7f,b9,87),HX_("lime_legacy_jni_create_method",1e,7e,51,88),(int)5);
            	}
{
            	HX_STACKFRAME(&_hx_pos_f7be42698d705636_190_boot)
HXDLIN( 190)		lime_jni_get_env = ::openfl::_legacy::Lib_obj::load(HX_("lime-legacy",c1,7f,b9,87),HX_("lime_legacy_jni_get_env",1e,62,c8,11),(int)0);
            	}
{
            	HX_STACKFRAME(&_hx_pos_f7be42698d705636_191_boot)
HXDLIN( 191)		lime_jni_call_member = ::openfl::_legacy::Lib_obj::load(HX_("lime-legacy",c1,7f,b9,87),HX_("lime_legacy_jni_call_member",b5,b5,b2,8a),(int)3);
            	}
{
            	HX_STACKFRAME(&_hx_pos_f7be42698d705636_192_boot)
HXDLIN( 192)		lime_jni_call_static = ::openfl::_legacy::Lib_obj::load(HX_("lime-legacy",c1,7f,b9,87),HX_("lime_legacy_jni_call_static",09,b0,f8,8b),(int)2);
            	}
}

} // end namespace openfl
} // end namespace _legacy
} // end namespace utils
