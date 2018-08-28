// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl_display3D_Program3D
#define INCLUDED_openfl_display3D_Program3D

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(openfl,_legacy,gl,GLObject)
HX_DECLARE_CLASS3(openfl,_legacy,gl,GLProgram)
HX_DECLARE_CLASS3(openfl,_legacy,gl,GLShader)
HX_DECLARE_CLASS2(openfl,display3D,Context3D)
HX_DECLARE_CLASS2(openfl,display3D,Program3D)

namespace openfl{
namespace display3D{


class HXCPP_CLASS_ATTRIBUTES Program3D_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef Program3D_obj OBJ_;
		Program3D_obj();

	public:
		enum { _hx_ClassId = 0x28394b12 };

		void __construct( ::openfl::display3D::Context3D context, ::openfl::_legacy::gl::GLProgram program);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl.display3D.Program3D")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"openfl.display3D.Program3D"); }
		static hx::ObjectPtr< Program3D_obj > __new( ::openfl::display3D::Context3D context, ::openfl::_legacy::gl::GLProgram program);
		static hx::ObjectPtr< Program3D_obj > __alloc(hx::Ctx *_hx_ctx, ::openfl::display3D::Context3D context, ::openfl::_legacy::gl::GLProgram program);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Program3D_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("Program3D","\x15","\x00","\x97","\x7e"); }

		 ::openfl::display3D::Context3D context;
		 ::openfl::_legacy::gl::GLProgram glProgram;
		void dispose();
		::Dynamic dispose_dyn();

		void upload( ::openfl::_legacy::gl::GLShader vertexShader, ::openfl::_legacy::gl::GLShader fragmentShader);
		::Dynamic upload_dyn();

};

} // end namespace openfl
} // end namespace display3D

#endif /* INCLUDED_openfl_display3D_Program3D */ 
