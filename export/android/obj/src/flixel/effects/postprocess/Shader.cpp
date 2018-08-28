// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_flixel_effects_postprocess_Shader
#include <flixel/effects/postprocess/Shader.h>
#endif
#ifndef INCLUDED_haxe_Log
#include <haxe/Log.h>
#endif
#ifndef INCLUDED_openfl__legacy_gl_GL
#include <openfl/_legacy/gl/GL.h>
#endif
#ifndef INCLUDED_openfl__legacy_gl_GLObject
#include <openfl/_legacy/gl/GLObject.h>
#endif
#ifndef INCLUDED_openfl__legacy_gl_GLProgram
#include <openfl/_legacy/gl/GLProgram.h>
#endif
#ifndef INCLUDED_openfl__legacy_gl_GLShader
#include <openfl/_legacy/gl/GLShader.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_6e435df04edfbfcc_21_new,"flixel.effects.postprocess.Shader","new",0x5a1426b4,"flixel.effects.postprocess.Shader.new","flixel/effects/postprocess/Shader.hx",21,0x282d2ed9)
HX_LOCAL_STACK_FRAME(_hx_pos_6e435df04edfbfcc_50_compile,"flixel.effects.postprocess.Shader","compile",0x90bb35c7,"flixel.effects.postprocess.Shader.compile","flixel/effects/postprocess/Shader.hx",50,0x282d2ed9)
HX_LOCAL_STACK_FRAME(_hx_pos_6e435df04edfbfcc_71_attribute,"flixel.effects.postprocess.Shader","attribute",0xffa03d70,"flixel.effects.postprocess.Shader.attribute","flixel/effects/postprocess/Shader.hx",71,0x282d2ed9)
HX_LOCAL_STACK_FRAME(_hx_pos_6e435df04edfbfcc_81_uniform,"flixel.effects.postprocess.Shader","uniform",0xc2b05188,"flixel.effects.postprocess.Shader.uniform","flixel/effects/postprocess/Shader.hx",81,0x282d2ed9)
HX_LOCAL_STACK_FRAME(_hx_pos_6e435df04edfbfcc_89_bind,"flixel.effects.postprocess.Shader","bind",0x6fa228e9,"flixel.effects.postprocess.Shader.bind","flixel/effects/postprocess/Shader.hx",89,0x282d2ed9)
namespace flixel{
namespace effects{
namespace postprocess{

void Shader_obj::__construct(::Array< ::Dynamic> sources){
            	HX_GC_STACKFRAME(&_hx_pos_6e435df04edfbfcc_21_new)
HXLINE(  22)		int _hx_tmp = ::openfl::_legacy::gl::GL_obj::get_version();
HXDLIN(  22)		this->program =  ::openfl::_legacy::gl::GLProgram_obj::__alloc( HX_CTX ,_hx_tmp,::openfl::_legacy::gl::GL_obj::lime_gl_create_program());
HXLINE(  24)		{
HXLINE(  24)			int _g = (int)0;
HXDLIN(  24)			while((_g < sources->length)){
HXLINE(  24)				 ::Dynamic source = sources->__get(_g);
HXDLIN(  24)				_g = (_g + (int)1);
HXLINE(  26)				int shader;
HXDLIN(  26)				if (( (bool)(source->__Field(HX_("fragment",d0,5f,e5,ad),hx::paccDynamic)) )) {
HXLINE(  26)					shader = (int)35632;
            				}
            				else {
HXLINE(  26)					shader = (int)35633;
            				}
HXDLIN(  26)				 ::openfl::_legacy::gl::GLShader shader1 = this->compile(( (::String)(source->__Field(HX_("src",e4,a6,57,00),hx::paccDynamic)) ),shader);
HXLINE(  27)				if (hx::IsNull( shader1 )) {
HXLINE(  27)					return;
            				}
HXLINE(  28)				{
HXLINE(  28)					 ::openfl::_legacy::gl::GLProgram program = this->program;
HXDLIN(  28)					program->attach(shader1);
HXDLIN(  28)					::openfl::_legacy::gl::GL_obj::lime_gl_attach_shader(program->id,shader1->id);
            				}
HXLINE(  29)				{
HXLINE(  29)					::openfl::_legacy::gl::GL_obj::lime_gl_delete_shader(shader1->id);
HXDLIN(  29)					shader1->invalidate();
            				}
            			}
            		}
HXLINE(  32)		::openfl::_legacy::gl::GL_obj::lime_gl_link_program(this->program->id);
HXLINE(  34)		if ((( (int)(::openfl::_legacy::gl::GL_obj::lime_gl_get_program_parameter(this->program->id,(int)35714)) ) == (int)0)) {
HXLINE(  36)			 ::Dynamic _hx_tmp1 = ::haxe::Log_obj::trace;
HXDLIN(  36)			::String _hx_tmp2 = ( (::String)(::openfl::_legacy::gl::GL_obj::lime_gl_get_program_info_log(this->program->id)) );
HXDLIN(  36)			_hx_tmp1(_hx_tmp2,hx::SourceInfo(HX_("Shader.hx",99,a8,0b,d1),36,HX_("flixel.effects.postprocess.Shader",c2,fc,ed,12),HX_("new",60,d0,53,00)));
HXLINE(  37)			 ::Dynamic _hx_tmp3 = ::haxe::Log_obj::trace;
HXDLIN(  37)			::String _hx_tmp4 = (HX_("VALIDATE_STATUS: ",61,4a,52,b0) + ( (int)(::openfl::_legacy::gl::GL_obj::lime_gl_get_program_parameter(this->program->id,(int)35715)) ));
HXDLIN(  37)			_hx_tmp3(_hx_tmp4,hx::SourceInfo(HX_("Shader.hx",99,a8,0b,d1),37,HX_("flixel.effects.postprocess.Shader",c2,fc,ed,12),HX_("new",60,d0,53,00)));
HXLINE(  38)			 ::Dynamic _hx_tmp5 = ::haxe::Log_obj::trace;
HXDLIN(  38)			::String _hx_tmp6 = (HX_("ERROR: ",4e,70,de,69) + ( (int)(::openfl::_legacy::gl::GL_obj::lime_gl_get_error()) ));
HXDLIN(  38)			_hx_tmp5(_hx_tmp6,hx::SourceInfo(HX_("Shader.hx",99,a8,0b,d1),38,HX_("flixel.effects.postprocess.Shader",c2,fc,ed,12),HX_("new",60,d0,53,00)));
HXLINE(  39)			return;
            		}
            	}

Dynamic Shader_obj::__CreateEmpty() { return new Shader_obj; }

void *Shader_obj::_hx_vtable = 0;

Dynamic Shader_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< Shader_obj > _hx_result = new Shader_obj();
	_hx_result->__construct(inArgs[0]);
	return _hx_result;
}

bool Shader_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x0ece7a6e;
}

 ::openfl::_legacy::gl::GLShader Shader_obj::compile(::String source,int type){
            	HX_GC_STACKFRAME(&_hx_pos_6e435df04edfbfcc_50_compile)
HXLINE(  51)		int shader = ::openfl::_legacy::gl::GL_obj::get_version();
HXDLIN(  51)		 ::openfl::_legacy::gl::GLShader shader1 =  ::openfl::_legacy::gl::GLShader_obj::__alloc( HX_CTX ,shader,::openfl::_legacy::gl::GL_obj::lime_gl_create_shader(type));
HXLINE(  52)		::openfl::_legacy::gl::GL_obj::lime_gl_shader_source(shader1->id,source);
HXLINE(  53)		::openfl::_legacy::gl::GL_obj::lime_gl_compile_shader(shader1->id);
HXLINE(  55)		if ((( (int)(::openfl::_legacy::gl::GL_obj::lime_gl_get_shader_parameter(shader1->id,(int)35713)) ) == (int)0)) {
HXLINE(  57)			 ::Dynamic _hx_tmp = ::haxe::Log_obj::trace;
HXDLIN(  57)			::String _hx_tmp1 = ( (::String)(::openfl::_legacy::gl::GL_obj::lime_gl_get_shader_info_log(shader1->id)) );
HXDLIN(  57)			_hx_tmp(_hx_tmp1,hx::SourceInfo(HX_("Shader.hx",99,a8,0b,d1),57,HX_("flixel.effects.postprocess.Shader",c2,fc,ed,12),HX_("compile",73,25,6f,83)));
HXLINE(  58)			return null();
            		}
HXLINE(  61)		return shader1;
            	}


HX_DEFINE_DYNAMIC_FUNC2(Shader_obj,compile,return )

int Shader_obj::attribute(::String a){
            	HX_STACKFRAME(&_hx_pos_6e435df04edfbfcc_71_attribute)
HXDLIN(  71)		return ( (int)(::openfl::_legacy::gl::GL_obj::lime_gl_get_attrib_location(this->program->id,a)) );
            	}


HX_DEFINE_DYNAMIC_FUNC1(Shader_obj,attribute,return )

int Shader_obj::uniform(::String u){
            	HX_STACKFRAME(&_hx_pos_6e435df04edfbfcc_81_uniform)
HXDLIN(  81)		return ( (int)(::openfl::_legacy::gl::GL_obj::lime_gl_get_uniform_location(this->program->id,u)) );
            	}


HX_DEFINE_DYNAMIC_FUNC1(Shader_obj,uniform,return )

void Shader_obj::bind(){
            	HX_STACKFRAME(&_hx_pos_6e435df04edfbfcc_89_bind)
HXDLIN(  89)		 ::openfl::_legacy::gl::GLProgram program = this->program;
HXDLIN(  89)		 ::Dynamic _hx_tmp;
HXDLIN(  89)		if (hx::IsNull( program )) {
HXDLIN(  89)			_hx_tmp = null();
            		}
            		else {
HXDLIN(  89)			_hx_tmp = program->id;
            		}
HXDLIN(  89)		::openfl::_legacy::gl::GL_obj::lime_gl_use_program(_hx_tmp);
            	}


HX_DEFINE_DYNAMIC_FUNC0(Shader_obj,bind,(void))


hx::ObjectPtr< Shader_obj > Shader_obj::__new(::Array< ::Dynamic> sources) {
	hx::ObjectPtr< Shader_obj > __this = new Shader_obj();
	__this->__construct(sources);
	return __this;
}

hx::ObjectPtr< Shader_obj > Shader_obj::__alloc(hx::Ctx *_hx_ctx,::Array< ::Dynamic> sources) {
	Shader_obj *__this = (Shader_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Shader_obj), true, "flixel.effects.postprocess.Shader"));
	*(void **)__this = Shader_obj::_hx_vtable;
	__this->__construct(sources);
	return __this;
}

Shader_obj::Shader_obj()
{
}

void Shader_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Shader);
	HX_MARK_MEMBER_NAME(program,"program");
	HX_MARK_END_CLASS();
}

void Shader_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(program,"program");
}

hx::Val Shader_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"bind") ) { return hx::Val( bind_dyn() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"program") ) { return hx::Val( program ); }
		if (HX_FIELD_EQ(inName,"compile") ) { return hx::Val( compile_dyn() ); }
		if (HX_FIELD_EQ(inName,"uniform") ) { return hx::Val( uniform_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"attribute") ) { return hx::Val( attribute_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val Shader_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"program") ) { program=inValue.Cast<  ::openfl::_legacy::gl::GLProgram >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Shader_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("program","\x84","\x4a","\xf9","\xf3"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo Shader_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*::openfl::_legacy::gl::GLProgram*/ ,(int)offsetof(Shader_obj,program),HX_HCSTRING("program","\x84","\x4a","\xf9","\xf3")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *Shader_obj_sStaticStorageInfo = 0;
#endif

static ::String Shader_obj_sMemberFields[] = {
	HX_HCSTRING("program","\x84","\x4a","\xf9","\xf3"),
	HX_HCSTRING("compile","\x73","\x25","\x6f","\x83"),
	HX_HCSTRING("attribute","\x1c","\x70","\xf0","\xfa"),
	HX_HCSTRING("uniform","\x34","\x41","\x64","\xb5"),
	HX_HCSTRING("bind","\xbd","\xf5","\x16","\x41"),
	::String(null()) };

static void Shader_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Shader_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void Shader_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Shader_obj::__mClass,"__mClass");
};

#endif

hx::Class Shader_obj::__mClass;

void Shader_obj::__register()
{
	hx::Object *dummy = new Shader_obj;
	Shader_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("flixel.effects.postprocess.Shader","\xc2","\xfc","\xed","\x12");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = Shader_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(Shader_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< Shader_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = Shader_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Shader_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Shader_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace flixel
} // end namespace effects
} // end namespace postprocess
