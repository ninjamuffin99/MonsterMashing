// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_openfl_display_PNGEncoderOptions
#include <openfl/display/PNGEncoderOptions.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_3a64445735a88117_12_new,"openfl.display.PNGEncoderOptions","new",0x5da61973,"openfl.display.PNGEncoderOptions.new","openfl/display/PNGEncoderOptions.hx",12,0xcb23cb5f)
namespace openfl{
namespace display{

void PNGEncoderOptions_obj::__construct(hx::Null< bool >  __o_fastCompression){
bool fastCompression = __o_fastCompression.Default(false);
            	HX_STACKFRAME(&_hx_pos_3a64445735a88117_12_new)
HXDLIN(  12)		this->fastCompression = fastCompression;
            	}

Dynamic PNGEncoderOptions_obj::__CreateEmpty() { return new PNGEncoderOptions_obj; }

void *PNGEncoderOptions_obj::_hx_vtable = 0;

Dynamic PNGEncoderOptions_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< PNGEncoderOptions_obj > _hx_result = new PNGEncoderOptions_obj();
	_hx_result->__construct(inArgs[0]);
	return _hx_result;
}

bool PNGEncoderOptions_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x06198ce1;
}


PNGEncoderOptions_obj::PNGEncoderOptions_obj()
{
}

hx::Val PNGEncoderOptions_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 15:
		if (HX_FIELD_EQ(inName,"fastCompression") ) { return hx::Val( fastCompression ); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val PNGEncoderOptions_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 15:
		if (HX_FIELD_EQ(inName,"fastCompression") ) { fastCompression=inValue.Cast< bool >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void PNGEncoderOptions_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("fastCompression","\x2a","\x9a","\x82","\x9b"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo PNGEncoderOptions_obj_sMemberStorageInfo[] = {
	{hx::fsBool,(int)offsetof(PNGEncoderOptions_obj,fastCompression),HX_HCSTRING("fastCompression","\x2a","\x9a","\x82","\x9b")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *PNGEncoderOptions_obj_sStaticStorageInfo = 0;
#endif

static ::String PNGEncoderOptions_obj_sMemberFields[] = {
	HX_HCSTRING("fastCompression","\x2a","\x9a","\x82","\x9b"),
	::String(null()) };

static void PNGEncoderOptions_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(PNGEncoderOptions_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void PNGEncoderOptions_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(PNGEncoderOptions_obj::__mClass,"__mClass");
};

#endif

hx::Class PNGEncoderOptions_obj::__mClass;

void PNGEncoderOptions_obj::__register()
{
	hx::Object *dummy = new PNGEncoderOptions_obj;
	PNGEncoderOptions_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("openfl.display.PNGEncoderOptions","\x01","\xe4","\xc1","\x5a");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = PNGEncoderOptions_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(PNGEncoderOptions_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< PNGEncoderOptions_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = PNGEncoderOptions_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = PNGEncoderOptions_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = PNGEncoderOptions_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace openfl
} // end namespace display
