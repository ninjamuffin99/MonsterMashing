// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl__legacy_utils_IDataInput
#define INCLUDED_openfl__legacy_utils_IDataInput

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS3(openfl,_legacy,utils,ByteArray)
HX_DECLARE_CLASS3(openfl,_legacy,utils,IDataInput)
HX_DECLARE_CLASS3(openfl,_legacy,utils,IDataOutput)
HX_DECLARE_CLASS3(openfl,_legacy,utils,IMemoryRange)

namespace openfl{
namespace _legacy{
namespace utils{


class HXCPP_CLASS_ATTRIBUTES IDataInput_obj {
	public:
		typedef hx::Object super;
		HX_DO_INTERFACE_RTTI;

		::String (hx::Object :: *_hx_set_endian)(::String value); 
		static inline ::String set_endian( ::Dynamic _hx_,::String value) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::utils::IDataInput_obj *>(_hx_.mPtr->_hx_getInterface(0x0ada9f10)))->_hx_set_endian)(value);
		}
		::String (hx::Object :: *_hx_get_endian)(); 
		static inline ::String get_endian( ::Dynamic _hx_) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::utils::IDataInput_obj *>(_hx_.mPtr->_hx_getInterface(0x0ada9f10)))->_hx_get_endian)();
		}
		int (hx::Object :: *_hx_get_bytesAvailable)(); 
		static inline int get_bytesAvailable( ::Dynamic _hx_) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::utils::IDataInput_obj *>(_hx_.mPtr->_hx_getInterface(0x0ada9f10)))->_hx_get_bytesAvailable)();
		}
		bool (hx::Object :: *_hx_readBoolean)(); 
		static inline bool readBoolean( ::Dynamic _hx_) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::utils::IDataInput_obj *>(_hx_.mPtr->_hx_getInterface(0x0ada9f10)))->_hx_readBoolean)();
		}
		int (hx::Object :: *_hx_readByte)(); 
		static inline int readByte( ::Dynamic _hx_) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::utils::IDataInput_obj *>(_hx_.mPtr->_hx_getInterface(0x0ada9f10)))->_hx_readByte)();
		}
		void (hx::Object :: *_hx_readBytes)( ::openfl::_legacy::utils::ByteArray data,hx::Null< int >  offset,hx::Null< int >  length); 
		static inline void readBytes( ::Dynamic _hx_, ::openfl::_legacy::utils::ByteArray data,hx::Null< int >  offset,hx::Null< int >  length) {
			(_hx_.mPtr->*( static_cast< ::openfl::_legacy::utils::IDataInput_obj *>(_hx_.mPtr->_hx_getInterface(0x0ada9f10)))->_hx_readBytes)(data,offset,length);
		}
		Float (hx::Object :: *_hx_readDouble)(); 
		static inline Float readDouble( ::Dynamic _hx_) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::utils::IDataInput_obj *>(_hx_.mPtr->_hx_getInterface(0x0ada9f10)))->_hx_readDouble)();
		}
		Float (hx::Object :: *_hx_readFloat)(); 
		static inline Float readFloat( ::Dynamic _hx_) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::utils::IDataInput_obj *>(_hx_.mPtr->_hx_getInterface(0x0ada9f10)))->_hx_readFloat)();
		}
		int (hx::Object :: *_hx_readInt)(); 
		static inline int readInt( ::Dynamic _hx_) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::utils::IDataInput_obj *>(_hx_.mPtr->_hx_getInterface(0x0ada9f10)))->_hx_readInt)();
		}
		int (hx::Object :: *_hx_readShort)(); 
		static inline int readShort( ::Dynamic _hx_) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::utils::IDataInput_obj *>(_hx_.mPtr->_hx_getInterface(0x0ada9f10)))->_hx_readShort)();
		}
		int (hx::Object :: *_hx_readUnsignedByte)(); 
		static inline int readUnsignedByte( ::Dynamic _hx_) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::utils::IDataInput_obj *>(_hx_.mPtr->_hx_getInterface(0x0ada9f10)))->_hx_readUnsignedByte)();
		}
		int (hx::Object :: *_hx_readUnsignedInt)(); 
		static inline int readUnsignedInt( ::Dynamic _hx_) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::utils::IDataInput_obj *>(_hx_.mPtr->_hx_getInterface(0x0ada9f10)))->_hx_readUnsignedInt)();
		}
		int (hx::Object :: *_hx_readUnsignedShort)(); 
		static inline int readUnsignedShort( ::Dynamic _hx_) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::utils::IDataInput_obj *>(_hx_.mPtr->_hx_getInterface(0x0ada9f10)))->_hx_readUnsignedShort)();
		}
		::String (hx::Object :: *_hx_readUTF)(); 
		static inline ::String readUTF( ::Dynamic _hx_) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::utils::IDataInput_obj *>(_hx_.mPtr->_hx_getInterface(0x0ada9f10)))->_hx_readUTF)();
		}
		::String (hx::Object :: *_hx_readUTFBytes)(int length); 
		static inline ::String readUTFBytes( ::Dynamic _hx_,int length) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::utils::IDataInput_obj *>(_hx_.mPtr->_hx_getInterface(0x0ada9f10)))->_hx_readUTFBytes)(length);
		}
};

} // end namespace openfl
} // end namespace _legacy
} // end namespace utils

#endif /* INCLUDED_openfl__legacy_utils_IDataInput */ 
