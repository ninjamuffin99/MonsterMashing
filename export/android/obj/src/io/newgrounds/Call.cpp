// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_Reflect
#include <Reflect.h>
#endif
#ifndef INCLUDED_haxe_Http
#include <haxe/Http.h>
#endif
#ifndef INCLUDED_haxe_IMap
#include <haxe/IMap.h>
#endif
#ifndef INCLUDED_haxe_ds_StringMap
#include <haxe/ds/StringMap.h>
#endif
#ifndef INCLUDED_haxe_format_JsonPrinter
#include <haxe/format/JsonPrinter.h>
#endif
#ifndef INCLUDED_io_newgrounds_Call
#include <io/newgrounds/Call.h>
#endif
#ifndef INCLUDED_io_newgrounds_ICallable
#include <io/newgrounds/ICallable.h>
#endif
#ifndef INCLUDED_io_newgrounds_NGLite
#include <io/newgrounds/NGLite.h>
#endif
#ifndef INCLUDED_io_newgrounds_objects_Error
#include <io/newgrounds/objects/Error.h>
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
#ifndef INCLUDED_io_newgrounds_utils_TypedDispatcher
#include <io/newgrounds/utils/TypedDispatcher.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_f1ddbe0d84463704_42_new,"io.newgrounds.Call","new",0x1ccf1d2a,"io.newgrounds.Call.new","io/newgrounds/Call.hx",42,0xa923bbe6)
HX_LOCAL_STACK_FRAME(_hx_pos_f1ddbe0d84463704_51_addProperty,"io.newgrounds.Call","addProperty",0x8ab8a660,"io.newgrounds.Call.addProperty","io/newgrounds/Call.hx",51,0xa923bbe6)
HX_LOCAL_STACK_FRAME(_hx_pos_f1ddbe0d84463704_62_addComponentParameter,"io.newgrounds.Call","addComponentParameter",0xd39c1ef7,"io.newgrounds.Call.addComponentParameter","io/newgrounds/Call.hx",62,0xa923bbe6)
HX_LOCAL_STACK_FRAME(_hx_pos_f1ddbe0d84463704_76_addDataHandler,"io.newgrounds.Call","addDataHandler",0xe294b595,"io.newgrounds.Call.addDataHandler","io/newgrounds/Call.hx",76,0xa923bbe6)
HX_LOCAL_STACK_FRAME(_hx_pos_f1ddbe0d84463704_86_addSuccessHandler,"io.newgrounds.Call","addSuccessHandler",0x660b3892,"io.newgrounds.Call.addSuccessHandler","io/newgrounds/Call.hx",86,0xa923bbe6)
HX_LOCAL_STACK_FRAME(_hx_pos_f1ddbe0d84463704_96_addErrorHandler,"io.newgrounds.Call","addErrorHandler",0x1575546d,"io.newgrounds.Call.addErrorHandler","io/newgrounds/Call.hx",96,0xa923bbe6)
HX_LOCAL_STACK_FRAME(_hx_pos_f1ddbe0d84463704_106_addStatusHandler,"io.newgrounds.Call","addStatusHandler",0xc6b7f4cd,"io.newgrounds.Call.addStatusHandler","io/newgrounds/Call.hx",106,0xa923bbe6)
HX_LOCAL_STACK_FRAME(_hx_pos_f1ddbe0d84463704_119_send,"io.newgrounds.Call","send",0x1bb8713e,"io.newgrounds.Call.send","io/newgrounds/Call.hx",119,0xa923bbe6)
HX_LOCAL_STACK_FRAME(_hx_pos_f1ddbe0d84463704_182_queue,"io.newgrounds.Call","queue",0x096a20db,"io.newgrounds.Call.queue","io/newgrounds/Call.hx",182,0xa923bbe6)
HX_LOCAL_STACK_FRAME(_hx_pos_f1ddbe0d84463704_185_onData,"io.newgrounds.Call","onData",0x490eac5f,"io.newgrounds.Call.onData","io/newgrounds/Call.hx",185,0xa923bbe6)
HX_LOCAL_STACK_FRAME(_hx_pos_f1ddbe0d84463704_203_onHttpError,"io.newgrounds.Call","onHttpError",0x125edccb,"io.newgrounds.Call.onHttpError","io/newgrounds/Call.hx",203,0xa923bbe6)
HX_LOCAL_STACK_FRAME(_hx_pos_f1ddbe0d84463704_214_onStatus,"io.newgrounds.Call","onStatus",0x8ed0f4a7,"io.newgrounds.Call.onStatus","io/newgrounds/Call.hx",214,0xa923bbe6)
HX_LOCAL_STACK_FRAME(_hx_pos_f1ddbe0d84463704_222_destroy,"io.newgrounds.Call","destroy",0x5d88a6c4,"io.newgrounds.Call.destroy","io/newgrounds/Call.hx",222,0xa923bbe6)
HX_LOCAL_STACK_FRAME(_hx_pos_f1ddbe0d84463704_26_boot,"io.newgrounds.Call","boot",0x10836828,"io.newgrounds.Call.boot","io/newgrounds/Call.hx",26,0xa923bbe6)
namespace io{
namespace newgrounds{

void Call_obj::__construct( ::io::newgrounds::NGLite core,::String component,hx::Null< bool >  __o_requireSession,hx::Null< bool >  __o_isSecure){
bool requireSession = __o_requireSession.Default(false);
bool isSecure = __o_isSecure.Default(false);
            	HX_STACKFRAME(&_hx_pos_f1ddbe0d84463704_42_new)
HXLINE(  44)		this->_core = core;
HXLINE(  45)		this->component = component;
HXLINE(  46)		this->_requireSession = requireSession;
HXLINE(  47)		bool _hx_tmp;
HXDLIN(  47)		if (isSecure) {
HXLINE(  47)			_hx_tmp = hx::IsNotNull( core->encryptionHandler );
            		}
            		else {
HXLINE(  47)			_hx_tmp = false;
            		}
HXDLIN(  47)		this->_isSecure = _hx_tmp;
            	}

Dynamic Call_obj::__CreateEmpty() { return new Call_obj; }

void *Call_obj::_hx_vtable = 0;

Dynamic Call_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< Call_obj > _hx_result = new Call_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3]);
	return _hx_result;
}

bool Call_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x68a0f050;
}

static ::io::newgrounds::ICallable_obj _hx_io_newgrounds_Call__hx_io_newgrounds_ICallable= {
	( void (hx::Object::*)())&::io::newgrounds::Call_obj::send,
	( void (hx::Object::*)())&::io::newgrounds::Call_obj::queue,
	( void (hx::Object::*)())&::io::newgrounds::Call_obj::destroy,
};

void *Call_obj::_hx_getInterface(int inHash) {
	switch(inHash) {
		case (int)0xda87fdcf: return &_hx_io_newgrounds_Call__hx_io_newgrounds_ICallable;
	}
	#ifdef HXCPP_SCRIPTABLE
	return super::_hx_getInterface(inHash);
	#else
	return 0;
	#endif
}

 ::io::newgrounds::Call Call_obj::addProperty(::String name, ::Dynamic value){
            	HX_GC_STACKFRAME(&_hx_pos_f1ddbe0d84463704_51_addProperty)
HXLINE(  53)		if (hx::IsNull( this->_properties )) {
HXLINE(  54)			this->_properties =  ::haxe::ds::StringMap_obj::__alloc( HX_CTX );
            		}
HXLINE(  56)		this->_properties->set(name,value);
HXLINE(  58)		return hx::ObjectPtr<OBJ_>(this);
            	}


HX_DEFINE_DYNAMIC_FUNC2(Call_obj,addProperty,return )

 ::io::newgrounds::Call Call_obj::addComponentParameter(::String name, ::Dynamic value, ::Dynamic defaultValue){
            	HX_GC_STACKFRAME(&_hx_pos_f1ddbe0d84463704_62_addComponentParameter)
HXLINE(  64)		if (hx::IsEq( value,defaultValue )) {
HXLINE(  65)			return hx::ObjectPtr<OBJ_>(this);
            		}
HXLINE(  67)		if (hx::IsNull( this->_parameters )) {
HXLINE(  68)			this->_parameters =  ::haxe::ds::StringMap_obj::__alloc( HX_CTX );
            		}
HXLINE(  70)		this->_parameters->set(name,value);
HXLINE(  72)		return hx::ObjectPtr<OBJ_>(this);
            	}


HX_DEFINE_DYNAMIC_FUNC3(Call_obj,addComponentParameter,return )

 ::io::newgrounds::Call Call_obj::addDataHandler( ::Dynamic handler){
            	HX_GC_STACKFRAME(&_hx_pos_f1ddbe0d84463704_76_addDataHandler)
HXLINE(  78)		if (hx::IsNull( this->_dataHandlers )) {
HXLINE(  79)			this->_dataHandlers =  ::io::newgrounds::utils::TypedDispatcher_obj::__alloc( HX_CTX );
            		}
HXLINE(  81)		this->_dataHandlers->add(handler,null());
HXLINE(  82)		return hx::ObjectPtr<OBJ_>(this);
            	}


HX_DEFINE_DYNAMIC_FUNC1(Call_obj,addDataHandler,return )

 ::io::newgrounds::Call Call_obj::addSuccessHandler( ::Dynamic handler){
            	HX_GC_STACKFRAME(&_hx_pos_f1ddbe0d84463704_86_addSuccessHandler)
HXLINE(  88)		if (hx::IsNull( this->_successHandlers )) {
HXLINE(  89)			this->_successHandlers =  ::io::newgrounds::utils::Dispatcher_obj::__alloc( HX_CTX );
            		}
HXLINE(  91)		this->_successHandlers->add(handler,null());
HXLINE(  92)		return hx::ObjectPtr<OBJ_>(this);
            	}


HX_DEFINE_DYNAMIC_FUNC1(Call_obj,addSuccessHandler,return )

 ::io::newgrounds::Call Call_obj::addErrorHandler( ::Dynamic handler){
            	HX_GC_STACKFRAME(&_hx_pos_f1ddbe0d84463704_96_addErrorHandler)
HXLINE(  98)		if (hx::IsNull( this->_httpErrorHandlers )) {
HXLINE(  99)			this->_httpErrorHandlers =  ::io::newgrounds::utils::TypedDispatcher_obj::__alloc( HX_CTX );
            		}
HXLINE( 101)		this->_httpErrorHandlers->add(handler,null());
HXLINE( 102)		return hx::ObjectPtr<OBJ_>(this);
            	}


HX_DEFINE_DYNAMIC_FUNC1(Call_obj,addErrorHandler,return )

 ::io::newgrounds::Call Call_obj::addStatusHandler( ::Dynamic handler){
            	HX_GC_STACKFRAME(&_hx_pos_f1ddbe0d84463704_106_addStatusHandler)
HXLINE( 108)		if (hx::IsNull( this->_statusHandlers )) {
HXLINE( 109)			this->_statusHandlers =  ::io::newgrounds::utils::TypedDispatcher_obj::__alloc( HX_CTX );
            		}
HXLINE( 111)		this->_statusHandlers->add(handler,null());
HXLINE( 112)		return hx::ObjectPtr<OBJ_>(this);
            	}


HX_DEFINE_DYNAMIC_FUNC1(Call_obj,addStatusHandler,return )

void Call_obj::send(){
            	HX_GC_STACKFRAME(&_hx_pos_f1ddbe0d84463704_119_send)
HXLINE( 121)		 ::Dynamic data =  ::Dynamic(hx::Anon_obj::Create(0));
HXLINE( 122)		data->__SetField(HX_("app_id",f9,4f,cf,8f),this->_core->appId,hx::paccDynamic);
HXLINE( 123)		data->__SetField(HX_("call",9e,18,ba,41), ::Dynamic(hx::Anon_obj::Create(0)),hx::paccDynamic);
HXLINE( 124)		 ::Dynamic(data->__Field(HX_("call",9e,18,ba,41),hx::paccDynamic))->__SetField(HX_("component",bd,f0,53,0f),this->component,hx::paccDynamic);
HXLINE( 126)		if (this->_core->debug) {
HXLINE( 127)			this->addProperty(HX_("debug",53,52,1f,d7),true);
            		}
HXLINE( 129)		bool _hx_tmp;
HXDLIN( 129)		if (hx::IsNotNull( this->_properties )) {
HXLINE( 129)			_hx_tmp = !(this->_properties->exists(HX_("session_id",64,14,71,28)));
            		}
            		else {
HXLINE( 129)			_hx_tmp = true;
            		}
HXDLIN( 129)		if (_hx_tmp) {
HXLINE( 132)			if (hx::IsNotNull( this->_core->sessionId )) {
HXLINE( 135)				this->addProperty(HX_("session_id",64,14,71,28),this->_core->sessionId);
            			}
            			else {
HXLINE( 137)				if (this->_requireSession) {
HXLINE( 139)					 ::Dynamic _hx_tmp1 = this->_core->logError;
HXDLIN( 139)					_hx_tmp1( ::io::newgrounds::objects::Error_obj::__alloc( HX_CTX ,((HX_("cannot send \"",c7,4a,46,e2) + this->component) + HX_("\" call without a sessionId",b6,01,39,6a)),null()),hx::SourceInfo(HX_("Call.hx",c0,08,89,21),139,HX_("io.newgrounds.Call",38,00,23,72),HX_("send",48,8d,50,4c)));
HXLINE( 140)					return;
            				}
            			}
            		}
HXLINE( 144)		if (hx::IsNotNull( this->_properties )) {
HXLINE( 146)			 ::Dynamic field = this->_properties->keys();
HXDLIN( 146)			while(( (bool)(field->__Field(HX_("hasNext",6d,a5,46,18),hx::paccDynamic)()) )){
HXLINE( 146)				::String field1 = ( (::String)(field->__Field(HX_("next",f3,84,02,49),hx::paccDynamic)()) );
HXLINE( 147)				::Reflect_obj::setField(data,field1,this->_properties->get(field1));
            			}
            		}
HXLINE( 150)		if (hx::IsNotNull( this->_parameters )) {
HXLINE( 152)			 ::Dynamic(data->__Field(HX_("call",9e,18,ba,41),hx::paccDynamic))->__SetField(HX_("parameters",aa,be,7e,51), ::Dynamic(hx::Anon_obj::Create(0)),hx::paccDynamic);
HXLINE( 154)			{
HXLINE( 154)				 ::Dynamic field2 = this->_parameters->keys();
HXDLIN( 154)				while(( (bool)(field2->__Field(HX_("hasNext",6d,a5,46,18),hx::paccDynamic)()) )){
HXLINE( 154)					::String field3 = ( (::String)(field2->__Field(HX_("next",f3,84,02,49),hx::paccDynamic)()) );
HXLINE( 155)					 ::Dynamic data1 =  ::Dynamic( ::Dynamic(data->__Field(HX_("call",9e,18,ba,41),hx::paccDynamic))->__Field(HX_("parameters",aa,be,7e,51),hx::paccDynamic));
HXDLIN( 155)					::Reflect_obj::setField(data1,field3,this->_parameters->get(field3));
            				}
            			}
            		}
HXLINE( 158)		{
HXLINE( 158)			 ::io::newgrounds::NGLite _this = this->_core;
HXDLIN( 158)			 ::Dynamic any = (HX_("Post  - ",d3,33,57,c2) + ::haxe::format::JsonPrinter_obj::print(data,null(),null()));
HXDLIN( 158)			if (_this->verbose) {
HXLINE( 158)				_this->log(any,hx::SourceInfo(HX_("Call.hx",c0,08,89,21),158,HX_("io.newgrounds.Call",38,00,23,72),HX_("send",48,8d,50,4c)));
            			}
            		}
HXLINE( 160)		if (this->_isSecure) {
HXLINE( 162)			 ::Dynamic secureData = this->_core->encryptionHandler;
HXDLIN( 162)			::String secureData1 = ( (::String)(secureData(::haxe::format::JsonPrinter_obj::print( ::Dynamic(data->__Field(HX_("call",9e,18,ba,41),hx::paccDynamic)),null(),null()))) );
HXLINE( 163)			data->__SetField(HX_("call",9e,18,ba,41), ::Dynamic(hx::Anon_obj::Create(0)),hx::paccDynamic);
HXLINE( 164)			 ::Dynamic(data->__Field(HX_("call",9e,18,ba,41),hx::paccDynamic))->__SetField(HX_("secure",77,60,4c,64),secureData1,hx::paccDynamic);
HXLINE( 166)			{
HXLINE( 166)				 ::io::newgrounds::NGLite _this1 = this->_core;
HXDLIN( 166)				if (_this1->verbose) {
HXLINE( 166)					 ::Dynamic _this2 = _this1->log;
HXDLIN( 166)					_this2((HX_("    secure - ",5c,3b,8a,2b) + secureData1),hx::SourceInfo(HX_("Call.hx",c0,08,89,21),166,HX_("io.newgrounds.Call",38,00,23,72),HX_("send",48,8d,50,4c)));
            				}
            			}
            		}
HXLINE( 169)		this->_core->markCallPending_io_newgrounds_Call_T(hx::ObjectPtr<OBJ_>(this));
HXLINE( 171)		 ::haxe::Http http =  ::haxe::Http_obj::__alloc( HX_CTX ,HX_("https://newgrounds.io/gateway_v3.php",f8,8a,a1,a2));
HXLINE( 172)		http->setParameter(HX_("input",0a,c4,1d,be),::haxe::format::JsonPrinter_obj::print(data,null(),null()));
HXLINE( 173)		http->onData = this->onData_dyn();
HXLINE( 174)		http->onError = this->onHttpError_dyn();
HXLINE( 175)		http->onStatus = this->onStatus_dyn();
HXLINE( 176)		http->request(true);
            	}


HX_DEFINE_DYNAMIC_FUNC0(Call_obj,send,(void))

void Call_obj::queue(){
            	HX_STACKFRAME(&_hx_pos_f1ddbe0d84463704_182_queue)
HXDLIN( 182)		this->_core->queueCall_io_newgrounds_Call_T(hx::ObjectPtr<OBJ_>(this));
            	}


HX_DEFINE_DYNAMIC_FUNC0(Call_obj,queue,(void))

void Call_obj::onData(::String reply){
            	HX_GC_STACKFRAME(&_hx_pos_f1ddbe0d84463704_185_onData)
HXLINE( 187)		{
HXLINE( 187)			 ::io::newgrounds::NGLite _this = this->_core;
HXDLIN( 187)			if (_this->verbose) {
HXLINE( 187)				 ::Dynamic _this1 = _this->log;
HXDLIN( 187)				_this1((HX_("Reply - ",a9,b8,72,01) + reply),hx::SourceInfo(HX_("Call.hx",c0,08,89,21),187,HX_("io.newgrounds.Call",38,00,23,72),HX_("onData",e9,5e,ed,e4)));
            			}
            		}
HXLINE( 189)		bool _hx_tmp;
HXDLIN( 189)		if (hx::IsNull( this->_dataHandlers )) {
HXLINE( 189)			_hx_tmp = hx::IsNull( this->_successHandlers );
            		}
            		else {
HXLINE( 189)			_hx_tmp = false;
            		}
HXDLIN( 189)		if (_hx_tmp) {
HXLINE( 190)			return;
            		}
HXLINE( 192)		 ::io::newgrounds::objects::events::Response response =  ::io::newgrounds::objects::events::Response_obj::__alloc( HX_CTX ,this->_core,reply);
HXLINE( 194)		if (hx::IsNotNull( this->_dataHandlers )) {
HXLINE( 195)			this->_dataHandlers->dispatch(response);
            		}
HXLINE( 197)		bool _hx_tmp1;
HXDLIN( 197)		bool _hx_tmp2;
HXDLIN( 197)		if (response->success) {
HXLINE( 197)			_hx_tmp2 = response->result->success;
            		}
            		else {
HXLINE( 197)			_hx_tmp2 = false;
            		}
HXDLIN( 197)		if (_hx_tmp2) {
HXLINE( 197)			_hx_tmp1 = hx::IsNotNull( this->_successHandlers );
            		}
            		else {
HXLINE( 197)			_hx_tmp1 = false;
            		}
HXDLIN( 197)		if (_hx_tmp1) {
HXLINE( 198)			this->_successHandlers->dispatch();
            		}
HXLINE( 200)		this->destroy();
            	}


HX_DEFINE_DYNAMIC_FUNC1(Call_obj,onData,(void))

void Call_obj::onHttpError(::String message){
            	HX_GC_STACKFRAME(&_hx_pos_f1ddbe0d84463704_203_onHttpError)
HXLINE( 205)		this->_core->logError(message,hx::SourceInfo(HX_("Call.hx",c0,08,89,21),205,HX_("io.newgrounds.Call",38,00,23,72),HX_("onHttpError",01,b6,3a,65)));
HXLINE( 207)		if (hx::IsNull( this->_httpErrorHandlers )) {
HXLINE( 208)			return;
            		}
HXLINE( 210)		 ::io::newgrounds::objects::Error error =  ::io::newgrounds::objects::Error_obj::__alloc( HX_CTX ,message,null());
HXLINE( 211)		this->_httpErrorHandlers->dispatch(error);
            	}


HX_DEFINE_DYNAMIC_FUNC1(Call_obj,onHttpError,(void))

void Call_obj::onStatus(int status){
            	HX_STACKFRAME(&_hx_pos_f1ddbe0d84463704_214_onStatus)
HXLINE( 216)		if (hx::IsNull( this->_statusHandlers )) {
HXLINE( 217)			return;
            		}
HXLINE( 219)		this->_statusHandlers->dispatch(status);
            	}


HX_DEFINE_DYNAMIC_FUNC1(Call_obj,onStatus,(void))

void Call_obj::destroy(){
            	HX_STACKFRAME(&_hx_pos_f1ddbe0d84463704_222_destroy)
HXLINE( 224)		this->_core = null();
HXLINE( 226)		this->_properties = null();
HXLINE( 227)		this->_parameters = null();
HXLINE( 229)		this->_dataHandlers = null();
HXLINE( 230)		this->_successHandlers = null();
HXLINE( 231)		this->_httpErrorHandlers = null();
HXLINE( 232)		this->_statusHandlers = null();
            	}


HX_DEFINE_DYNAMIC_FUNC0(Call_obj,destroy,(void))

::String Call_obj::PATH;


hx::ObjectPtr< Call_obj > Call_obj::__new( ::io::newgrounds::NGLite core,::String component,hx::Null< bool >  __o_requireSession,hx::Null< bool >  __o_isSecure) {
	hx::ObjectPtr< Call_obj > __this = new Call_obj();
	__this->__construct(core,component,__o_requireSession,__o_isSecure);
	return __this;
}

hx::ObjectPtr< Call_obj > Call_obj::__alloc(hx::Ctx *_hx_ctx, ::io::newgrounds::NGLite core,::String component,hx::Null< bool >  __o_requireSession,hx::Null< bool >  __o_isSecure) {
	Call_obj *__this = (Call_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Call_obj), true, "io.newgrounds.Call"));
	*(void **)__this = Call_obj::_hx_vtable;
	__this->__construct(core,component,__o_requireSession,__o_isSecure);
	return __this;
}

Call_obj::Call_obj()
{
}

void Call_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Call);
	HX_MARK_MEMBER_NAME(component,"component");
	HX_MARK_MEMBER_NAME(_core,"_core");
	HX_MARK_MEMBER_NAME(_properties,"_properties");
	HX_MARK_MEMBER_NAME(_parameters,"_parameters");
	HX_MARK_MEMBER_NAME(_requireSession,"_requireSession");
	HX_MARK_MEMBER_NAME(_isSecure,"_isSecure");
	HX_MARK_MEMBER_NAME(_dataHandlers,"_dataHandlers");
	HX_MARK_MEMBER_NAME(_successHandlers,"_successHandlers");
	HX_MARK_MEMBER_NAME(_httpErrorHandlers,"_httpErrorHandlers");
	HX_MARK_MEMBER_NAME(_statusHandlers,"_statusHandlers");
	HX_MARK_END_CLASS();
}

void Call_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(component,"component");
	HX_VISIT_MEMBER_NAME(_core,"_core");
	HX_VISIT_MEMBER_NAME(_properties,"_properties");
	HX_VISIT_MEMBER_NAME(_parameters,"_parameters");
	HX_VISIT_MEMBER_NAME(_requireSession,"_requireSession");
	HX_VISIT_MEMBER_NAME(_isSecure,"_isSecure");
	HX_VISIT_MEMBER_NAME(_dataHandlers,"_dataHandlers");
	HX_VISIT_MEMBER_NAME(_successHandlers,"_successHandlers");
	HX_VISIT_MEMBER_NAME(_httpErrorHandlers,"_httpErrorHandlers");
	HX_VISIT_MEMBER_NAME(_statusHandlers,"_statusHandlers");
}

hx::Val Call_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"send") ) { return hx::Val( send_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"_core") ) { return hx::Val( _core ); }
		if (HX_FIELD_EQ(inName,"queue") ) { return hx::Val( queue_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"onData") ) { return hx::Val( onData_dyn() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"destroy") ) { return hx::Val( destroy_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"onStatus") ) { return hx::Val( onStatus_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"component") ) { return hx::Val( component ); }
		if (HX_FIELD_EQ(inName,"_isSecure") ) { return hx::Val( _isSecure ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"_properties") ) { return hx::Val( _properties ); }
		if (HX_FIELD_EQ(inName,"_parameters") ) { return hx::Val( _parameters ); }
		if (HX_FIELD_EQ(inName,"addProperty") ) { return hx::Val( addProperty_dyn() ); }
		if (HX_FIELD_EQ(inName,"onHttpError") ) { return hx::Val( onHttpError_dyn() ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"_dataHandlers") ) { return hx::Val( _dataHandlers ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"addDataHandler") ) { return hx::Val( addDataHandler_dyn() ); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"_requireSession") ) { return hx::Val( _requireSession ); }
		if (HX_FIELD_EQ(inName,"_statusHandlers") ) { return hx::Val( _statusHandlers ); }
		if (HX_FIELD_EQ(inName,"addErrorHandler") ) { return hx::Val( addErrorHandler_dyn() ); }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"_successHandlers") ) { return hx::Val( _successHandlers ); }
		if (HX_FIELD_EQ(inName,"addStatusHandler") ) { return hx::Val( addStatusHandler_dyn() ); }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"addSuccessHandler") ) { return hx::Val( addSuccessHandler_dyn() ); }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"_httpErrorHandlers") ) { return hx::Val( _httpErrorHandlers ); }
		break;
	case 21:
		if (HX_FIELD_EQ(inName,"addComponentParameter") ) { return hx::Val( addComponentParameter_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val Call_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"_core") ) { _core=inValue.Cast<  ::io::newgrounds::NGLite >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"component") ) { component=inValue.Cast< ::String >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_isSecure") ) { _isSecure=inValue.Cast< bool >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"_properties") ) { _properties=inValue.Cast<  ::haxe::ds::StringMap >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_parameters") ) { _parameters=inValue.Cast<  ::haxe::ds::StringMap >(); return inValue; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"_dataHandlers") ) { _dataHandlers=inValue.Cast<  ::io::newgrounds::utils::TypedDispatcher >(); return inValue; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"_requireSession") ) { _requireSession=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_statusHandlers") ) { _statusHandlers=inValue.Cast<  ::io::newgrounds::utils::TypedDispatcher >(); return inValue; }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"_successHandlers") ) { _successHandlers=inValue.Cast<  ::io::newgrounds::utils::Dispatcher >(); return inValue; }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"_httpErrorHandlers") ) { _httpErrorHandlers=inValue.Cast<  ::io::newgrounds::utils::TypedDispatcher >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Call_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("component","\xbd","\xf0","\x53","\x0f"));
	outFields->push(HX_HCSTRING("_core","\x3e","\xd9","\xd5","\xf4"));
	outFields->push(HX_HCSTRING("_properties","\x12","\xc9","\x98","\x33"));
	outFields->push(HX_HCSTRING("_parameters","\xc9","\x8b","\x08","\x24"));
	outFields->push(HX_HCSTRING("_requireSession","\x10","\x87","\x83","\x2a"));
	outFields->push(HX_HCSTRING("_isSecure","\x60","\xf3","\x4b","\x04"));
	outFields->push(HX_HCSTRING("_dataHandlers","\x92","\x00","\x89","\x23"));
	outFields->push(HX_HCSTRING("_successHandlers","\xcd","\x40","\x13","\xe2"));
	outFields->push(HX_HCSTRING("_httpErrorHandlers","\x6a","\x75","\x9b","\x6b"));
	outFields->push(HX_HCSTRING("_statusHandlers","\x5a","\x8f","\x17","\xfa"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo Call_obj_sMemberStorageInfo[] = {
	{hx::fsString,(int)offsetof(Call_obj,component),HX_HCSTRING("component","\xbd","\xf0","\x53","\x0f")},
	{hx::fsObject /*::io::newgrounds::NGLite*/ ,(int)offsetof(Call_obj,_core),HX_HCSTRING("_core","\x3e","\xd9","\xd5","\xf4")},
	{hx::fsObject /*::haxe::ds::StringMap*/ ,(int)offsetof(Call_obj,_properties),HX_HCSTRING("_properties","\x12","\xc9","\x98","\x33")},
	{hx::fsObject /*::haxe::ds::StringMap*/ ,(int)offsetof(Call_obj,_parameters),HX_HCSTRING("_parameters","\xc9","\x8b","\x08","\x24")},
	{hx::fsBool,(int)offsetof(Call_obj,_requireSession),HX_HCSTRING("_requireSession","\x10","\x87","\x83","\x2a")},
	{hx::fsBool,(int)offsetof(Call_obj,_isSecure),HX_HCSTRING("_isSecure","\x60","\xf3","\x4b","\x04")},
	{hx::fsObject /*::io::newgrounds::utils::TypedDispatcher*/ ,(int)offsetof(Call_obj,_dataHandlers),HX_HCSTRING("_dataHandlers","\x92","\x00","\x89","\x23")},
	{hx::fsObject /*::io::newgrounds::utils::Dispatcher*/ ,(int)offsetof(Call_obj,_successHandlers),HX_HCSTRING("_successHandlers","\xcd","\x40","\x13","\xe2")},
	{hx::fsObject /*::io::newgrounds::utils::TypedDispatcher*/ ,(int)offsetof(Call_obj,_httpErrorHandlers),HX_HCSTRING("_httpErrorHandlers","\x6a","\x75","\x9b","\x6b")},
	{hx::fsObject /*::io::newgrounds::utils::TypedDispatcher*/ ,(int)offsetof(Call_obj,_statusHandlers),HX_HCSTRING("_statusHandlers","\x5a","\x8f","\x17","\xfa")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo Call_obj_sStaticStorageInfo[] = {
	{hx::fsString,(void *) &Call_obj::PATH,HX_HCSTRING("PATH","\xa5","\xad","\x12","\x35")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static ::String Call_obj_sMemberFields[] = {
	HX_HCSTRING("component","\xbd","\xf0","\x53","\x0f"),
	HX_HCSTRING("_core","\x3e","\xd9","\xd5","\xf4"),
	HX_HCSTRING("_properties","\x12","\xc9","\x98","\x33"),
	HX_HCSTRING("_parameters","\xc9","\x8b","\x08","\x24"),
	HX_HCSTRING("_requireSession","\x10","\x87","\x83","\x2a"),
	HX_HCSTRING("_isSecure","\x60","\xf3","\x4b","\x04"),
	HX_HCSTRING("_dataHandlers","\x92","\x00","\x89","\x23"),
	HX_HCSTRING("_successHandlers","\xcd","\x40","\x13","\xe2"),
	HX_HCSTRING("_httpErrorHandlers","\x6a","\x75","\x9b","\x6b"),
	HX_HCSTRING("_statusHandlers","\x5a","\x8f","\x17","\xfa"),
	HX_HCSTRING("addProperty","\x96","\x7f","\x94","\xdd"),
	HX_HCSTRING("addComponentParameter","\xad","\xd7","\x0b","\x1e"),
	HX_HCSTRING("addDataHandler","\x1f","\x02","\x98","\x1d"),
	HX_HCSTRING("addSuccessHandler","\x48","\xde","\x56","\x46"),
	HX_HCSTRING("addErrorHandler","\xa3","\x00","\x55","\x7d"),
	HX_HCSTRING("addStatusHandler","\xd7","\xf7","\x8e","\x42"),
	HX_HCSTRING("send","\x48","\x8d","\x50","\x4c"),
	HX_HCSTRING("queue","\x91","\x8d","\xea","\x5d"),
	HX_HCSTRING("onData","\xe9","\x5e","\xed","\xe4"),
	HX_HCSTRING("onHttpError","\x01","\xb6","\x3a","\x65"),
	HX_HCSTRING("onStatus","\xb1","\xdd","\xa8","\xe5"),
	HX_HCSTRING("destroy","\xfa","\x2c","\x86","\x24"),
	::String(null()) };

static void Call_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Call_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(Call_obj::PATH,"PATH");
};

#ifdef HXCPP_VISIT_ALLOCS
static void Call_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Call_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(Call_obj::PATH,"PATH");
};

#endif

hx::Class Call_obj::__mClass;

static ::String Call_obj_sStaticFields[] = {
	HX_HCSTRING("PATH","\xa5","\xad","\x12","\x35"),
	::String(null())
};

void Call_obj::__register()
{
	hx::Object *dummy = new Call_obj;
	Call_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("io.newgrounds.Call","\x38","\x00","\x23","\x72");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = Call_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(Call_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(Call_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< Call_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = Call_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Call_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Call_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void Call_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_f1ddbe0d84463704_26_boot)
HXDLIN(  26)		PATH = HX_("https://newgrounds.io/gateway_v3.php",f8,8a,a1,a2);
            	}
}

} // end namespace io
} // end namespace newgrounds
