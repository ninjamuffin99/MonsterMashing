// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_flixel_util_FlxBitmapDataPool
#include <flixel/util/FlxBitmapDataPool.h>
#endif
#ifndef INCLUDED_flixel_util__FlxBitmapDataPool_FlxBitmapDataPoolNode
#include <flixel/util/_FlxBitmapDataPool/FlxBitmapDataPoolNode.h>
#endif
#ifndef INCLUDED_openfl__legacy_display_BitmapData
#include <openfl/_legacy/display/BitmapData.h>
#endif
#ifndef INCLUDED_openfl__legacy_display_IBitmapDrawable
#include <openfl/_legacy/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl__legacy_geom_Rectangle
#include <openfl/_legacy/geom/Rectangle.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_f71e48b1d97abdba_41_get,"flixel.util.FlxBitmapDataPool","get",0x62a51335,"flixel.util.FlxBitmapDataPool.get","flixel/util/FlxBitmapDataPool.hx",41,0x992b0db1)
HX_LOCAL_STACK_FRAME(_hx_pos_f71e48b1d97abdba_89_put,"flixel.util.FlxBitmapDataPool","put",0x62abf56e,"flixel.util.FlxBitmapDataPool.put","flixel/util/FlxBitmapDataPool.hx",89,0x992b0db1)
HX_LOCAL_STACK_FRAME(_hx_pos_f71e48b1d97abdba_121_clear,"flixel.util.FlxBitmapDataPool","clear",0xdb7329ec,"flixel.util.FlxBitmapDataPool.clear","flixel/util/FlxBitmapDataPool.hx",121,0x992b0db1)
HX_LOCAL_STACK_FRAME(_hx_pos_f71e48b1d97abdba_135_set_maxLength,"flixel.util.FlxBitmapDataPool","set_maxLength",0xa2220bec,"flixel.util.FlxBitmapDataPool.set_maxLength","flixel/util/FlxBitmapDataPool.hx",135,0x992b0db1)
HX_LOCAL_STACK_FRAME(_hx_pos_f71e48b1d97abdba_21_boot,"flixel.util.FlxBitmapDataPool","boot",0xea853cb3,"flixel.util.FlxBitmapDataPool.boot","flixel/util/FlxBitmapDataPool.hx",21,0x992b0db1)
HX_LOCAL_STACK_FRAME(_hx_pos_f71e48b1d97abdba_26_boot,"flixel.util.FlxBitmapDataPool","boot",0xea853cb3,"flixel.util.FlxBitmapDataPool.boot","flixel/util/FlxBitmapDataPool.hx",26,0x992b0db1)
HX_LOCAL_STACK_FRAME(_hx_pos_f71e48b1d97abdba_28_boot,"flixel.util.FlxBitmapDataPool","boot",0xea853cb3,"flixel.util.FlxBitmapDataPool.boot","flixel/util/FlxBitmapDataPool.hx",28,0x992b0db1)
HX_LOCAL_STACK_FRAME(_hx_pos_f71e48b1d97abdba_29_boot,"flixel.util.FlxBitmapDataPool","boot",0xea853cb3,"flixel.util.FlxBitmapDataPool.boot","flixel/util/FlxBitmapDataPool.hx",29,0x992b0db1)
HX_LOCAL_STACK_FRAME(_hx_pos_f71e48b1d97abdba_31_boot,"flixel.util.FlxBitmapDataPool","boot",0xea853cb3,"flixel.util.FlxBitmapDataPool.boot","flixel/util/FlxBitmapDataPool.hx",31,0x992b0db1)
namespace flixel{
namespace util{

void FlxBitmapDataPool_obj::__construct() { }

Dynamic FlxBitmapDataPool_obj::__CreateEmpty() { return new FlxBitmapDataPool_obj; }

void *FlxBitmapDataPool_obj::_hx_vtable = 0;

Dynamic FlxBitmapDataPool_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< FlxBitmapDataPool_obj > _hx_result = new FlxBitmapDataPool_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool FlxBitmapDataPool_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x181e5509;
}

int FlxBitmapDataPool_obj::maxLength;

int FlxBitmapDataPool_obj::length;

 ::flixel::util::_FlxBitmapDataPool::FlxBitmapDataPoolNode FlxBitmapDataPool_obj::_head;

 ::flixel::util::_FlxBitmapDataPool::FlxBitmapDataPoolNode FlxBitmapDataPool_obj::_tail;

 ::openfl::_legacy::geom::Rectangle FlxBitmapDataPool_obj::_rect;

 ::openfl::_legacy::display::BitmapData FlxBitmapDataPool_obj::get(int w,int h,hx::Null< bool >  __o_transparent, ::Dynamic fillColor, ::Dynamic __o_exactSize){
bool transparent = __o_transparent.Default(true);
 ::Dynamic exactSize = __o_exactSize.Default(false);
            	HX_GC_STACKFRAME(&_hx_pos_f71e48b1d97abdba_41_get)
HXLINE(  42)		 ::openfl::_legacy::display::BitmapData res = null();
HXLINE(  45)		 ::flixel::util::_FlxBitmapDataPool::FlxBitmapDataPoolNode node = ::flixel::util::FlxBitmapDataPool_obj::_head;
HXLINE(  46)		while(hx::IsNotNull( node )){
HXLINE(  48)			 ::openfl::_legacy::display::BitmapData bmd = node->bmd;
HXLINE(  49)			bool _hx_tmp;
HXDLIN(  49)			bool _hx_tmp1;
HXDLIN(  49)			bool _hx_tmp2;
HXDLIN(  49)			if ((bmd->get_transparent() == transparent)) {
HXLINE(  49)				_hx_tmp2 = (bmd->get_width() >= w);
            			}
            			else {
HXLINE(  49)				_hx_tmp2 = false;
            			}
HXDLIN(  49)			if (_hx_tmp2) {
HXLINE(  49)				_hx_tmp1 = (bmd->get_height() >= h);
            			}
            			else {
HXLINE(  49)				_hx_tmp1 = false;
            			}
HXDLIN(  49)			if (_hx_tmp1) {
HXLINE(  50)				if (!(!(exactSize))) {
HXLINE(  50)					bool _hx_tmp3;
HXDLIN(  50)					if (exactSize) {
HXLINE(  50)						_hx_tmp3 = (bmd->get_width() == w);
            					}
            					else {
HXLINE(  50)						_hx_tmp3 = false;
            					}
HXDLIN(  50)					if (_hx_tmp3) {
HXLINE(  49)						_hx_tmp = (bmd->get_height() == h);
            					}
            					else {
HXLINE(  49)						_hx_tmp = false;
            					}
            				}
            				else {
HXLINE(  49)					_hx_tmp = true;
            				}
            			}
            			else {
HXLINE(  49)				_hx_tmp = false;
            			}
HXDLIN(  49)			if (_hx_tmp) {
HXLINE(  52)				res = bmd;
HXLINE(  55)				if (hx::IsNotNull( node->prev )) {
HXLINE(  55)					node->prev->next = node->next;
            				}
HXLINE(  56)				if (hx::IsNotNull( node->next )) {
HXLINE(  56)					node->next->prev = node->prev;
            				}
HXLINE(  57)				if (hx::IsEq( node,::flixel::util::FlxBitmapDataPool_obj::_head )) {
HXLINE(  57)					::flixel::util::FlxBitmapDataPool_obj::_head = node->next;
            				}
HXLINE(  58)				if (hx::IsEq( node,::flixel::util::FlxBitmapDataPool_obj::_tail )) {
HXLINE(  58)					::flixel::util::FlxBitmapDataPool_obj::_tail = node->prev;
            				}
HXLINE(  59)				node = null();
HXLINE(  60)				::flixel::util::FlxBitmapDataPool_obj::length--;
HXLINE(  61)				goto _hx_goto_0;
            			}
HXLINE(  63)			node = node->next;
            		}
            		_hx_goto_0:;
HXLINE(  66)		if (hx::IsNotNull( res )) {
HXLINE(  68)			if (hx::IsNotNull( fillColor )) {
HXLINE(  70)				::flixel::util::FlxBitmapDataPool_obj::_rect->x = (int)0;
HXLINE(  71)				::flixel::util::FlxBitmapDataPool_obj::_rect->y = (int)0;
HXLINE(  72)				::flixel::util::FlxBitmapDataPool_obj::_rect->width = w;
HXLINE(  73)				::flixel::util::FlxBitmapDataPool_obj::_rect->height = h;
HXLINE(  74)				res->fillRect(::flixel::util::FlxBitmapDataPool_obj::_rect,fillColor);
            			}
            		}
            		else {
HXLINE(  79)			int res1;
HXDLIN(  79)			if (hx::IsNotNull( fillColor )) {
HXLINE(  79)				res1 = fillColor;
            			}
            			else {
HXLINE(  79)				res1 = (int)-1;
            			}
HXDLIN(  79)			res =  ::openfl::_legacy::display::BitmapData_obj::__alloc( HX_CTX ,w,h,transparent,res1,null());
            		}
HXLINE(  82)		return res;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC5(FlxBitmapDataPool_obj,get,return )

void FlxBitmapDataPool_obj::put( ::openfl::_legacy::display::BitmapData bmd){
            	HX_GC_STACKFRAME(&_hx_pos_f71e48b1d97abdba_89_put)
HXLINE(  90)		if ((::flixel::util::FlxBitmapDataPool_obj::length >= ::flixel::util::FlxBitmapDataPool_obj::maxLength)) {
HXLINE(  92)			 ::flixel::util::_FlxBitmapDataPool::FlxBitmapDataPoolNode last = ::flixel::util::FlxBitmapDataPool_obj::_tail;
HXLINE(  93)			last->bmd->dispose();
HXLINE(  94)			if (hx::IsNotNull( last->prev )) {
HXLINE(  96)				last->prev->next = null();
HXLINE(  97)				::flixel::util::FlxBitmapDataPool_obj::_tail = last->prev;
            			}
HXLINE(  99)			last = null();
HXLINE( 100)			::flixel::util::FlxBitmapDataPool_obj::length--;
            		}
HXLINE( 103)		 ::flixel::util::_FlxBitmapDataPool::FlxBitmapDataPoolNode node =  ::flixel::util::_FlxBitmapDataPool::FlxBitmapDataPoolNode_obj::__alloc( HX_CTX ,bmd,null(),null());
HXLINE( 104)		node->next = ::flixel::util::FlxBitmapDataPool_obj::_head;
HXLINE( 105)		if (hx::IsNull( ::flixel::util::FlxBitmapDataPool_obj::_head )) {
HXLINE( 107)			::flixel::util::FlxBitmapDataPool_obj::_head = (::flixel::util::FlxBitmapDataPool_obj::_tail = node);
            		}
            		else {
HXLINE( 111)			::flixel::util::FlxBitmapDataPool_obj::_head = node;
HXLINE( 112)			node->next->prev = node;
            		}
HXLINE( 114)		::flixel::util::FlxBitmapDataPool_obj::length++;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(FlxBitmapDataPool_obj,put,(void))

void FlxBitmapDataPool_obj::clear(){
            	HX_STACKFRAME(&_hx_pos_f71e48b1d97abdba_121_clear)
HXLINE( 122)		 ::flixel::util::_FlxBitmapDataPool::FlxBitmapDataPoolNode node = ::flixel::util::FlxBitmapDataPool_obj::_head;
HXLINE( 123)		while(hx::IsNotNull( node )){
HXLINE( 125)			 ::openfl::_legacy::display::BitmapData bmd = node->bmd;
HXLINE( 126)			bmd->dispose();
HXLINE( 127)			bmd = null();
HXLINE( 128)			node = node->next;
            		}
HXLINE( 130)		::flixel::util::FlxBitmapDataPool_obj::length = (int)0;
HXLINE( 131)		::flixel::util::FlxBitmapDataPool_obj::_head = (::flixel::util::FlxBitmapDataPool_obj::_tail = null());
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(FlxBitmapDataPool_obj,clear,(void))

int FlxBitmapDataPool_obj::set_maxLength(int value){
            	HX_STACKFRAME(&_hx_pos_f71e48b1d97abdba_135_set_maxLength)
HXLINE( 136)		if ((::flixel::util::FlxBitmapDataPool_obj::maxLength != value)) {
HXLINE( 138)			 ::flixel::util::_FlxBitmapDataPool::FlxBitmapDataPoolNode node = ::flixel::util::FlxBitmapDataPool_obj::_tail;
HXLINE( 139)			while(true){
HXLINE( 139)				bool _hx_tmp;
HXDLIN( 139)				if (hx::IsNotNull( node )) {
HXLINE( 139)					_hx_tmp = (::flixel::util::FlxBitmapDataPool_obj::length > value);
            				}
            				else {
HXLINE( 139)					_hx_tmp = false;
            				}
HXDLIN( 139)				if (!(_hx_tmp)) {
HXLINE( 139)					goto _hx_goto_5;
            				}
HXLINE( 141)				 ::openfl::_legacy::display::BitmapData bmd = node->bmd;
HXLINE( 142)				bmd->dispose();
HXLINE( 143)				bmd = null();
HXLINE( 144)				node = node->prev;
HXLINE( 145)				::flixel::util::FlxBitmapDataPool_obj::length--;
            			}
            			_hx_goto_5:;
            		}
HXLINE( 148)		return (::flixel::util::FlxBitmapDataPool_obj::maxLength = value);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(FlxBitmapDataPool_obj,set_maxLength,return )


FlxBitmapDataPool_obj::FlxBitmapDataPool_obj()
{
}

bool FlxBitmapDataPool_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"get") ) { outValue = get_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"put") ) { outValue = put_dyn(); return true; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"_head") ) { outValue = ( _head ); return true; }
		if (HX_FIELD_EQ(inName,"_tail") ) { outValue = ( _tail ); return true; }
		if (HX_FIELD_EQ(inName,"_rect") ) { outValue = ( _rect ); return true; }
		if (HX_FIELD_EQ(inName,"clear") ) { outValue = clear_dyn(); return true; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"length") ) { outValue = ( length ); return true; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"maxLength") ) { outValue = ( maxLength ); return true; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"set_maxLength") ) { outValue = set_maxLength_dyn(); return true; }
	}
	return false;
}

bool FlxBitmapDataPool_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"_head") ) { _head=ioValue.Cast<  ::flixel::util::_FlxBitmapDataPool::FlxBitmapDataPoolNode >(); return true; }
		if (HX_FIELD_EQ(inName,"_tail") ) { _tail=ioValue.Cast<  ::flixel::util::_FlxBitmapDataPool::FlxBitmapDataPoolNode >(); return true; }
		if (HX_FIELD_EQ(inName,"_rect") ) { _rect=ioValue.Cast<  ::openfl::_legacy::geom::Rectangle >(); return true; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"length") ) { length=ioValue.Cast< int >(); return true; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"maxLength") ) { if (inCallProp == hx::paccAlways)  ioValue = ( set_maxLength(ioValue.Cast< int >()) ); else maxLength=ioValue.Cast< int >(); return true; }
	}
	return false;
}

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *FlxBitmapDataPool_obj_sMemberStorageInfo = 0;
static hx::StaticInfo FlxBitmapDataPool_obj_sStaticStorageInfo[] = {
	{hx::fsInt,(void *) &FlxBitmapDataPool_obj::maxLength,HX_HCSTRING("maxLength","\xaa","\xa6","\x92","\xce")},
	{hx::fsInt,(void *) &FlxBitmapDataPool_obj::length,HX_HCSTRING("length","\xe6","\x94","\x07","\x9f")},
	{hx::fsObject /*::flixel::util::_FlxBitmapDataPool::FlxBitmapDataPoolNode*/ ,(void *) &FlxBitmapDataPool_obj::_head,HX_HCSTRING("_head","\xff","\x44","\x1c","\xf8")},
	{hx::fsObject /*::flixel::util::_FlxBitmapDataPool::FlxBitmapDataPoolNode*/ ,(void *) &FlxBitmapDataPool_obj::_tail,HX_HCSTRING("_tail","\x6f","\xd2","\x07","\x00")},
	{hx::fsObject /*::openfl::_legacy::geom::Rectangle*/ ,(void *) &FlxBitmapDataPool_obj::_rect,HX_HCSTRING("_rect","\x03","\x69","\xb8","\xfe")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static void FlxBitmapDataPool_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(FlxBitmapDataPool_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(FlxBitmapDataPool_obj::maxLength,"maxLength");
	HX_MARK_MEMBER_NAME(FlxBitmapDataPool_obj::length,"length");
	HX_MARK_MEMBER_NAME(FlxBitmapDataPool_obj::_head,"_head");
	HX_MARK_MEMBER_NAME(FlxBitmapDataPool_obj::_tail,"_tail");
	HX_MARK_MEMBER_NAME(FlxBitmapDataPool_obj::_rect,"_rect");
};

#ifdef HXCPP_VISIT_ALLOCS
static void FlxBitmapDataPool_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(FlxBitmapDataPool_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(FlxBitmapDataPool_obj::maxLength,"maxLength");
	HX_VISIT_MEMBER_NAME(FlxBitmapDataPool_obj::length,"length");
	HX_VISIT_MEMBER_NAME(FlxBitmapDataPool_obj::_head,"_head");
	HX_VISIT_MEMBER_NAME(FlxBitmapDataPool_obj::_tail,"_tail");
	HX_VISIT_MEMBER_NAME(FlxBitmapDataPool_obj::_rect,"_rect");
};

#endif

hx::Class FlxBitmapDataPool_obj::__mClass;

static ::String FlxBitmapDataPool_obj_sStaticFields[] = {
	HX_HCSTRING("maxLength","\xaa","\xa6","\x92","\xce"),
	HX_HCSTRING("length","\xe6","\x94","\x07","\x9f"),
	HX_HCSTRING("_head","\xff","\x44","\x1c","\xf8"),
	HX_HCSTRING("_tail","\x6f","\xd2","\x07","\x00"),
	HX_HCSTRING("_rect","\x03","\x69","\xb8","\xfe"),
	HX_HCSTRING("get","\x96","\x80","\x4e","\x00"),
	HX_HCSTRING("put","\xcf","\x62","\x55","\x00"),
	HX_HCSTRING("clear","\x8d","\x71","\x5b","\x48"),
	HX_HCSTRING("set_maxLength","\x8d","\x5c","\xfc","\xd4"),
	::String(null())
};

void FlxBitmapDataPool_obj::__register()
{
	hx::Object *dummy = new FlxBitmapDataPool_obj;
	FlxBitmapDataPool_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("flixel.util.FlxBitmapDataPool","\x8d","\x77","\xe7","\xe5");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &FlxBitmapDataPool_obj::__GetStatic;
	__mClass->mSetStaticField = &FlxBitmapDataPool_obj::__SetStatic;
	__mClass->mMarkFunc = FlxBitmapDataPool_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(FlxBitmapDataPool_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = hx::TCanCast< FlxBitmapDataPool_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = FlxBitmapDataPool_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = FlxBitmapDataPool_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = FlxBitmapDataPool_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void FlxBitmapDataPool_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_f71e48b1d97abdba_21_boot)
HXDLIN(  21)		maxLength = (int)8;
            	}
{
            	HX_STACKFRAME(&_hx_pos_f71e48b1d97abdba_26_boot)
HXDLIN(  26)		length = (int)0;
            	}
{
            	HX_STACKFRAME(&_hx_pos_f71e48b1d97abdba_28_boot)
HXDLIN(  28)		_head = null();
            	}
{
            	HX_STACKFRAME(&_hx_pos_f71e48b1d97abdba_29_boot)
HXDLIN(  29)		_tail = null();
            	}
{
            	HX_GC_STACKFRAME(&_hx_pos_f71e48b1d97abdba_31_boot)
HXDLIN(  31)		_rect =  ::openfl::_legacy::geom::Rectangle_obj::__alloc( HX_CTX ,null(),null(),null(),null());
            	}
}

} // end namespace flixel
} // end namespace util
