// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl__legacy_net_URLRequestMethod
#define INCLUDED_openfl__legacy_net_URLRequestMethod

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(openfl,_legacy,net,URLRequestMethod)

namespace openfl{
namespace _legacy{
namespace net{


class HXCPP_CLASS_ATTRIBUTES URLRequestMethod_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef URLRequestMethod_obj OBJ_;
		URLRequestMethod_obj();

	public:
		enum { _hx_ClassId = 0x5760512a };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="openfl._legacy.net.URLRequestMethod")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,false,"openfl._legacy.net.URLRequestMethod"); }

		hx::ObjectPtr< URLRequestMethod_obj > __new() {
			hx::ObjectPtr< URLRequestMethod_obj > __this = new URLRequestMethod_obj();
			__this->__construct();
			return __this;
		}

		static hx::ObjectPtr< URLRequestMethod_obj > __alloc(hx::Ctx *_hx_ctx) {
			URLRequestMethod_obj *__this = (URLRequestMethod_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(URLRequestMethod_obj), false, "openfl._legacy.net.URLRequestMethod"));
			*(void **)__this = URLRequestMethod_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~URLRequestMethod_obj();

		HX_DO_RTTI_ALL;
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("URLRequestMethod","\xc1","\x12","\x01","\xb4"); }

		static void __boot();
		static ::String DELETE;
		static ::String GET;
		static ::String HEAD;
		static ::String OPTIONS;
		static ::String POST;
		static ::String PUT;
};

} // end namespace openfl
} // end namespace _legacy
} // end namespace net

#endif /* INCLUDED_openfl__legacy_net_URLRequestMethod */ 
