// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_flixel_util_IFlxDestroyable
#include <flixel/util/IFlxDestroyable.h>
#endif

namespace flixel{
namespace util{


static ::String IFlxDestroyable_obj_sMemberFields[] = {
	HX_HCSTRING("destroy","\xfa","\x2c","\x86","\x24"),
	::String(null()) };

static void IFlxDestroyable_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(IFlxDestroyable_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void IFlxDestroyable_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(IFlxDestroyable_obj::__mClass,"__mClass");
};

#endif

hx::Class IFlxDestroyable_obj::__mClass;

void IFlxDestroyable_obj::__register()
{
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("flixel.util.IFlxDestroyable","\x51","\xe9","\x02","\x0d");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mMarkFunc = IFlxDestroyable_obj_sMarkStatics;
	__mClass->mMembers = hx::Class_obj::dupFunctions(IFlxDestroyable_obj_sMemberFields);
	__mClass->mCanCast = hx::TIsInterface< (int)0xd4fe2fcd >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = IFlxDestroyable_obj_sVisitStatics;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace flixel
} // end namespace util
