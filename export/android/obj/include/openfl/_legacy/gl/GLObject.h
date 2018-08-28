// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl__legacy_gl_GLObject
#define INCLUDED_openfl__legacy_gl_GLObject

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(openfl,_legacy,gl,GLObject)

namespace openfl{
namespace _legacy{
namespace gl{


class HXCPP_CLASS_ATTRIBUTES GLObject_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef GLObject_obj OBJ_;
		GLObject_obj();

	public:
		enum { _hx_ClassId = 0x2ef17041 };

		void __construct(int version, ::Dynamic id);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl._legacy.gl.GLObject")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"openfl._legacy.gl.GLObject"); }
		static hx::ObjectPtr< GLObject_obj > __new(int version, ::Dynamic id);
		static hx::ObjectPtr< GLObject_obj > __alloc(hx::Ctx *_hx_ctx,int version, ::Dynamic id);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~GLObject_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("GLObject","\xc4","\xda","\x30","\x7f"); }

		 ::Dynamic id;
		bool invalidated;
		bool valid;
		int version;
		virtual ::String getType();
		::Dynamic getType_dyn();

		void invalidate();
		::Dynamic invalidate_dyn();

		virtual bool isValid();
		::Dynamic isValid_dyn();

		bool isInvalid();
		::Dynamic isInvalid_dyn();

		virtual ::String toString();
		::Dynamic toString_dyn();

		bool get_invalidated();
		::Dynamic get_invalidated_dyn();

		bool get_valid();
		::Dynamic get_valid_dyn();

};

} // end namespace openfl
} // end namespace _legacy
} // end namespace gl

#endif /* INCLUDED_openfl__legacy_gl_GLObject */ 
