// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl__legacy_display_IGraphicsData
#define INCLUDED_openfl__legacy_display_IGraphicsData

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_STACK_FRAME(_hx_pos_ed6ca61e677a79ef_12_new)
HX_DECLARE_CLASS3(openfl,_legacy,display,IGraphicsData)

namespace openfl{
namespace _legacy{
namespace display{


class HXCPP_CLASS_ATTRIBUTES IGraphicsData_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef IGraphicsData_obj OBJ_;
		IGraphicsData_obj();

	public:
		enum { _hx_ClassId = 0x0be93e14 };

		void __construct( ::Dynamic handle);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl._legacy.display.IGraphicsData")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"openfl._legacy.display.IGraphicsData"); }

		hx::ObjectPtr< IGraphicsData_obj > __new( ::Dynamic handle) {
			hx::ObjectPtr< IGraphicsData_obj > __this = new IGraphicsData_obj();
			__this->__construct(handle);
			return __this;
		}

		static hx::ObjectPtr< IGraphicsData_obj > __alloc(hx::Ctx *_hx_ctx, ::Dynamic handle) {
			IGraphicsData_obj *__this = (IGraphicsData_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(IGraphicsData_obj), true, "openfl._legacy.display.IGraphicsData"));
			*(void **)__this = IGraphicsData_obj::_hx_vtable;
{
            	HX_STACKFRAME(&_hx_pos_ed6ca61e677a79ef_12_new)
HXDLIN(  12)		( ( ::openfl::_legacy::display::IGraphicsData)(__this) )->_hx___handle = handle;
            	}
		
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~IGraphicsData_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("IGraphicsData","\x7e","\x52","\x4e","\xed"); }

		 ::Dynamic _hx___handle;
};

} // end namespace openfl
} // end namespace _legacy
} // end namespace display

#endif /* INCLUDED_openfl__legacy_display_IGraphicsData */ 
