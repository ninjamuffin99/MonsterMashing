// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_openfl__legacy_display_CapsStyle
#include <openfl/_legacy/display/CapsStyle.h>
#endif
namespace openfl{
namespace _legacy{
namespace display{

::openfl::_legacy::display::CapsStyle CapsStyle_obj::NONE;

::openfl::_legacy::display::CapsStyle CapsStyle_obj::ROUND;

::openfl::_legacy::display::CapsStyle CapsStyle_obj::SQUARE;

bool CapsStyle_obj::__GetStatic(const ::String &inName, ::Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	if (inName==HX_("NONE",b8,da,ca,33)) { outValue = CapsStyle_obj::NONE; return true; }
	if (inName==HX_("ROUND",2e,30,54,6b)) { outValue = CapsStyle_obj::ROUND; return true; }
	if (inName==HX_("SQUARE",9d,ac,74,0b)) { outValue = CapsStyle_obj::SQUARE; return true; }
	return super::__GetStatic(inName, outValue, inCallProp);
}

HX_DEFINE_CREATE_ENUM(CapsStyle_obj)

int CapsStyle_obj::__FindIndex(::String inName)
{
	if (inName==HX_("NONE",b8,da,ca,33)) return 1;
	if (inName==HX_("ROUND",2e,30,54,6b)) return 0;
	if (inName==HX_("SQUARE",9d,ac,74,0b)) return 2;
	return super::__FindIndex(inName);
}

int CapsStyle_obj::__FindArgCount(::String inName)
{
	if (inName==HX_("NONE",b8,da,ca,33)) return 0;
	if (inName==HX_("ROUND",2e,30,54,6b)) return 0;
	if (inName==HX_("SQUARE",9d,ac,74,0b)) return 0;
	return super::__FindArgCount(inName);
}

hx::Val CapsStyle_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	if (inName==HX_("NONE",b8,da,ca,33)) return NONE;
	if (inName==HX_("ROUND",2e,30,54,6b)) return ROUND;
	if (inName==HX_("SQUARE",9d,ac,74,0b)) return SQUARE;
	return super::__Field(inName,inCallProp);
}

static ::String CapsStyle_obj_sStaticFields[] = {
	HX_("ROUND",2e,30,54,6b),
	HX_("NONE",b8,da,ca,33),
	HX_("SQUARE",9d,ac,74,0b),
	::String(null())
};

static void CapsStyle_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(CapsStyle_obj::NONE,"NONE");
	HX_MARK_MEMBER_NAME(CapsStyle_obj::ROUND,"ROUND");
	HX_MARK_MEMBER_NAME(CapsStyle_obj::SQUARE,"SQUARE");
};

#ifdef HXCPP_VISIT_ALLOCS
static void CapsStyle_obj_sVisitStatic(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(CapsStyle_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(CapsStyle_obj::NONE,"NONE");
	HX_VISIT_MEMBER_NAME(CapsStyle_obj::ROUND,"ROUND");
	HX_VISIT_MEMBER_NAME(CapsStyle_obj::SQUARE,"SQUARE");
};
#endif

hx::Class CapsStyle_obj::__mClass;

Dynamic __Create_CapsStyle_obj() { return new CapsStyle_obj; }

void CapsStyle_obj::__register()
{

hx::Static(__mClass) = hx::_hx_RegisterClass(HX_HCSTRING("openfl._legacy.display.CapsStyle","\xa0","\x93","\xb1","\x2e"), hx::TCanCast< CapsStyle_obj >,CapsStyle_obj_sStaticFields,0,
	&__Create_CapsStyle_obj, &__Create,
	&super::__SGetClass(), &CreateCapsStyle_obj, CapsStyle_obj_sMarkStatics
#ifdef HXCPP_VISIT_ALLOCS
    , CapsStyle_obj_sVisitStatic
#endif
#ifdef HXCPP_SCRIPTABLE
    , 0
#endif
);
	__mClass->mGetStaticField = &CapsStyle_obj::__GetStatic;
}

void CapsStyle_obj::__boot()
{
NONE = hx::CreateEnum< CapsStyle_obj >(HX_HCSTRING("NONE","\xb8","\xda","\xca","\x33"),1,0);
ROUND = hx::CreateEnum< CapsStyle_obj >(HX_HCSTRING("ROUND","\x2e","\x30","\x54","\x6b"),0,0);
SQUARE = hx::CreateEnum< CapsStyle_obj >(HX_HCSTRING("SQUARE","\x9d","\xac","\x74","\x0b"),2,0);
}


} // end namespace openfl
} // end namespace _legacy
} // end namespace display
