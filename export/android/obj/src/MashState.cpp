// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_MashState
#include <MashState.h>
#endif
#ifndef INCLUDED_Outcome
#include <Outcome.h>
#endif
#ifndef INCLUDED_SettingState
#include <SettingState.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_flixel_FlxBasic
#include <flixel/FlxBasic.h>
#endif
#ifndef INCLUDED_flixel_FlxCamera
#include <flixel/FlxCamera.h>
#endif
#ifndef INCLUDED_flixel_FlxG
#include <flixel/FlxG.h>
#endif
#ifndef INCLUDED_flixel_FlxObject
#include <flixel/FlxObject.h>
#endif
#ifndef INCLUDED_flixel_FlxSprite
#include <flixel/FlxSprite.h>
#endif
#ifndef INCLUDED_flixel_FlxState
#include <flixel/FlxState.h>
#endif
#ifndef INCLUDED_flixel_FlxSubState
#include <flixel/FlxSubState.h>
#endif
#ifndef INCLUDED_flixel_animation_FlxAnimationController
#include <flixel/animation/FlxAnimationController.h>
#endif
#ifndef INCLUDED_flixel_group_FlxTypedGroup
#include <flixel/group/FlxTypedGroup.h>
#endif
#ifndef INCLUDED_flixel_math_FlxMath
#include <flixel/math/FlxMath.h>
#endif
#ifndef INCLUDED_flixel_math_FlxPoint
#include <flixel/math/FlxPoint.h>
#endif
#ifndef INCLUDED_flixel_math_FlxRandom
#include <flixel/math/FlxRandom.h>
#endif
#ifndef INCLUDED_flixel_system_FlxSound
#include <flixel/system/FlxSound.h>
#endif
#ifndef INCLUDED_flixel_system_FlxSoundGroup
#include <flixel/system/FlxSoundGroup.h>
#endif
#ifndef INCLUDED_flixel_system_frontEnds_CameraFrontEnd
#include <flixel/system/frontEnds/CameraFrontEnd.h>
#endif
#ifndef INCLUDED_flixel_system_frontEnds_SoundFrontEnd
#include <flixel/system/frontEnds/SoundFrontEnd.h>
#endif
#ifndef INCLUDED_flixel_text_FlxText
#include <flixel/text/FlxText.h>
#endif
#ifndef INCLUDED_flixel_tweens_FlxEase
#include <flixel/tweens/FlxEase.h>
#endif
#ifndef INCLUDED_flixel_tweens_FlxTween
#include <flixel/tweens/FlxTween.h>
#endif
#ifndef INCLUDED_flixel_tweens_misc_VarTween
#include <flixel/tweens/misc/VarTween.h>
#endif
#ifndef INCLUDED_flixel_ui_FlxBar
#include <flixel/ui/FlxBar.h>
#endif
#ifndef INCLUDED_flixel_ui_FlxBarFillDirection
#include <flixel/ui/FlxBarFillDirection.h>
#endif
#ifndef INCLUDED_flixel_util_FlxAxes
#include <flixel/util/FlxAxes.h>
#endif
#ifndef INCLUDED_flixel_util_IFlxDestroyable
#include <flixel/util/IFlxDestroyable.h>
#endif
#ifndef INCLUDED_flixel_util_IFlxPooled
#include <flixel/util/IFlxPooled.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_f92e756756026210_19_new,"MashState","new",0x9ef5fd3a,"MashState.new","MashState.hx",19,0xe7750776)
HX_LOCAL_STACK_FRAME(_hx_pos_f92e756756026210_52_create,"MashState","create",0xd4293e62,"MashState.create","MashState.hx",52,0xe7750776)
static const int _hx_array_data_79349848_2[] = {
	(int)0,
};
static const int _hx_array_data_79349848_3[] = {
	(int)1,(int)1,(int)1,(int)0,
};
static const int _hx_array_data_79349848_4[] = {
	(int)2,
};
static const int _hx_array_data_79349848_5[] = {
	(int)0,(int)1,
};
HX_LOCAL_STACK_FRAME(_hx_pos_f92e756756026210_162_update,"MashState","update",0xdf1f5d6f,"MashState.update","MashState.hx",162,0xe7750776)
HX_LOCAL_STACK_FRAME(_hx_pos_f92e756756026210_234_mash,"MashState","mash",0x779b52cf,"MashState.mash","MashState.hx",234,0xe7750776)
HX_LOCAL_STACK_FRAME(_hx_pos_f92e756756026210_262_endTweens,"MashState","endTweens",0xc6d90e3d,"MashState.endTweens","MashState.hx",262,0xe7750776)
HX_LOCAL_STACK_FRAME(_hx_pos_f92e756756026210_276_finishTween,"MashState","finishTween",0x70b763f2,"MashState.finishTween","MashState.hx",276,0xe7750776)
HX_LOCAL_STACK_FRAME(_hx_pos_f92e756756026210_22_boot,"MashState","boot",0x70609618,"MashState.boot","MashState.hx",22,0xe7750776)

void MashState_obj::__construct(hx::Null< int >  __o_BGColor,int EType){
int BGColor = __o_BGColor.Default(0);
            	HX_STACKFRAME(&_hx_pos_f92e756756026210_19_new)
HXLINE(  38)		this->finishing = false;
HXLINE(  33)		this->mashTimer = ((Float)2.5);
HXLINE(  31)		this->maxShake = ((Float)0.05);
HXLINE(  29)		this->mashX = false;
HXLINE(  27)		this->_enemyHealth = ((Float)10);
HXLINE(  23)		this->enemyType = (int)0;
HXLINE(  42)		super::__construct(BGColor);
HXLINE(  43)		::flixel::FlxG_obj::camera->flash(null(),null(),null(),null());
HXLINE(  45)		this->enemyType = EType;
HXLINE(  48)		::MashState_obj::outcome = ::Outcome_obj::NONE_dyn();
            	}

Dynamic MashState_obj::__CreateEmpty() { return new MashState_obj; }

void *MashState_obj::_hx_vtable = 0;

Dynamic MashState_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< MashState_obj > _hx_result = new MashState_obj();
	_hx_result->__construct(inArgs[0],inArgs[1]);
	return _hx_result;
}

bool MashState_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x3634c52c) {
		if (inClassId<=(int)0x25a685e0) {
			if (inClassId<=(int)0x2335d9a7) {
				return inClassId==(int)0x00000001 || inClassId==(int)0x2335d9a7;
			} else {
				return inClassId==(int)0x25a685e0;
			}
		} else {
			return inClassId==(int)0x3634c52c;
		}
	} else {
		return inClassId==(int)0x79349848 || inClassId==(int)0x7f681f43;
	}
}

void MashState_obj::create(){
            	HX_GC_STACKFRAME(&_hx_pos_f92e756756026210_52_create)
HXLINE(  54)		this->thisCam =  ::flixel::FlxCamera_obj::__alloc( HX_CTX ,(int)0,(int)0,::flixel::FlxG_obj::width,::flixel::FlxG_obj::height,(int)1);
HXLINE(  55)		::flixel::FlxG_obj::cameras->add(this->thisCam).StaticCast<  ::flixel::FlxCamera >();
HXLINE(  56)		this->thisCam->bgColor = (int)0;
HXLINE(  60)		this->_enemySprite =  ::flixel::FlxSprite_obj::__alloc( HX_CTX ,(int)48,(int)0,null());
HXLINE(  63)		if (::SettingState_obj::aprilFools) {
HXLINE(  65)			int _g = this->enemyType;
HXDLIN(  65)			switch((int)(_g)){
            				case (int)0: {
HXLINE(  68)					this->_enemySprite->loadGraphic(HX_("assets/images/hotGF.png",1c,45,9e,ce),true,(int)800,(int)1200,null(),null());
            				}
            				break;
            				case (int)1: {
HXLINE(  70)					this->_enemySprite->loadGraphic(HX_("assets/images/sonky.png",b0,92,c5,a7),true,(int)800,(int)1200,null(),null());
            				}
            				break;
            				case (int)2: {
HXLINE(  72)					this->_enemySprite->loadGraphic(HX_("assets/images/kirbyGF.png",3a,4b,72,b8),true,(int)800,(int)1200,null(),null());
            				}
            				break;
            				case (int)3: {
HXLINE(  74)					this->_enemySprite->loadGraphic(HX_("assets/images/steveSheet.png",f2,b4,ee,71),true,(int)800,(int)1200,null(),null());
            				}
            				break;
            				default:{
HXLINE(  76)					this->_enemySprite->loadGraphic(HX_("assets/images/steveSheet.png",f2,b4,ee,71),true,(int)800,(int)1200,null(),null());
            				}
            			}
            		}
            		else {
HXLINE(  98)			 ::Dynamic tex;
HXLINE( 100)			{
HXLINE( 100)				int _g1 = this->enemyType;
HXDLIN( 100)				switch((int)(_g1)){
            					case (int)0: {
HXLINE( 103)						this->_enemySprite->loadGraphic(HX_("assets/images/mushSheet.png",12,9f,d7,4e),true,(int)800,(int)1200,null(),null());
            					}
            					break;
            					case (int)1: {
HXLINE( 105)						this->_enemySprite->loadGraphic(HX_("assets/images/vineSheet.png",45,65,6b,e8),true,(int)800,(int)1200,null(),null());
            					}
            					break;
            					case (int)2: {
HXLINE( 107)						this->_enemySprite->loadGraphic(HX_("assets/images/batSheet.png",f0,b2,f9,13),true,(int)800,(int)1200,null(),null());
            					}
            					break;
            					case (int)3: {
HXLINE( 109)						this->_enemySprite->loadGraphic(HX_("assets/images/slimeSheet.png",1d,ba,16,c3),true,(int)800,(int)1200,null(),null());
            					}
            					break;
            					case (int)4: {
HXLINE( 111)						this->_enemySprite->loadGraphic(HX_("assets/images/minotaurSheet.png",28,74,3d,2d),true,(int)800,(int)1200,null(),null());
            					}
            					break;
            					case (int)5: {
HXLINE( 113)						this->_enemySprite->loadGraphic(HX_("assets/images/echidnaSheet.png",cd,65,22,62),true,(int)800,(int)1200,null(),null());
            					}
            					break;
            					case (int)6: {
HXLINE( 115)						this->_enemySprite->loadGraphic(HX_("assets/images/clamSheet.png",3a,aa,68,f7),true,(int)800,(int)1200,null(),null());
            					}
            					break;
            					default:{
HXLINE( 117)						this->_enemySprite->loadGraphic(HX_("assets/images/mushSheet.png",12,9f,d7,4e),true,(int)800,(int)1200,null(),null());
            					}
            				}
            			}
            		}
HXLINE( 121)		this->_enemySprite->animation->add(HX_("normal",27,72,69,30),::Array_obj< int >::fromData( _hx_array_data_79349848_2,1),null(),null(),null(),null());
HXLINE( 122)		this->_enemySprite->animation->add(HX_("hit",53,46,4f,00),::Array_obj< int >::fromData( _hx_array_data_79349848_3,4),(int)12,false,null(),null());
HXLINE( 123)		this->_enemySprite->animation->add(HX_("stripped",f7,58,82,dd),::Array_obj< int >::fromData( _hx_array_data_79349848_4,1),null(),null(),null(),null());
HXLINE( 124)		this->_enemySprite->animation->play(HX_("normal",27,72,69,30),null(),null(),null());
HXLINE( 126)		this->add(this->_enemySprite);
HXLINE( 129)		this->_barHealth =  ::flixel::ui::FlxBar_obj::__alloc( HX_CTX ,(int)32,(int)-16,::flixel::ui::FlxBarFillDirection_obj::LEFT_TO_RIGHT_dyn(),(::flixel::FlxG_obj::width - (int)64),(int)16,hx::ObjectPtr<OBJ_>(this),HX_("_enemyHealth",05,43,c2,4a),(int)0,(int)10,null());
HXLINE( 133)		this->_barHealth->scrollFactor->set((int)0,(int)0);
HXLINE( 136)		{
HXLINE( 136)			 ::flixel::FlxCamera _this = this->thisCam;
HXDLIN( 136)			 ::flixel::math::FlxPoint point = this->_enemySprite->getMidpoint(null());
HXDLIN( 136)			 ::flixel::math::FlxPoint _this1 = _this->scroll;
HXDLIN( 136)			Float point1 = point->x;
HXDLIN( 136)			Float _hx_tmp = (point1 - (_this->width * ((Float)0.5)));
HXDLIN( 136)			Float point2 = point->y;
HXDLIN( 136)			_this1->set(_hx_tmp,(point2 - (_this->height * ((Float)0.5))));
HXDLIN( 136)			if (point->_weak) {
HXLINE( 136)				point->put();
            			}
            		}
HXLINE( 138)		this->_mashSprite =  ::flixel::FlxSprite_obj::__alloc( HX_CTX ,(int)0,(int)800,null());
HXLINE( 139)		this->_mashSprite->loadGraphic(HX_("assets/images/left_and_right.png",62,45,26,f8),true,(int)64,(int)32,null(),null());
HXLINE( 140)		this->_mashSprite->animation->add(HX_("mashin",0e,69,17,bb),::Array_obj< int >::fromData( _hx_array_data_79349848_5,2),(int)6,null(),null(),null());
HXLINE( 141)		this->_mashSprite->animation->play(HX_("mashin",0e,69,17,bb),null(),null(),null());
HXLINE( 142)		 ::flixel::FlxSprite _hx_tmp1 = this->_mashSprite;
HXDLIN( 142)		int _hx_tmp2 = ::Std_obj::_hx_int((this->_mashSprite->get_width() * (int)3));
HXDLIN( 142)		_hx_tmp1->setGraphicSize(_hx_tmp2,::Std_obj::_hx_int((this->_mashSprite->get_height() * (int)3)));
HXLINE( 143)		this->_mashSprite->updateHitbox();
HXLINE( 144)		this->_mashSprite->set_x((int)350);
HXLINE( 145)		this->add(this->_mashSprite);
HXLINE( 147)		this->txtTimer =  ::flixel::text::FlxText_obj::__alloc( HX_CTX ,(int)32,(int)-34,(int)0,HX_("",00,00,00,00),(int)32,null());
HXLINE( 148)		this->txtTimer->scrollFactor->set(null(),null());
HXLINE( 152)		::flixel::tweens::FlxTween_obj::tween(this->_barHealth, ::Dynamic(hx::Anon_obj::Create(1)
            			->setFixed(0,HX_("y",79,00,00,00),(int)16)),((Float)0.7), ::Dynamic(hx::Anon_obj::Create(1)
            			->setFixed(0,HX_("ease",ee,8b,0c,43),::flixel::tweens::FlxEase_obj::cubeInOut_dyn())));
HXLINE( 153)		::flixel::tweens::FlxTween_obj::tween(this->_enemySprite, ::Dynamic(hx::Anon_obj::Create(1)
            			->setFixed(0,HX_("y",79,00,00,00),(this->_enemySprite->y + (int)210))),((Float)0.7), ::Dynamic(hx::Anon_obj::Create(1)
            			->setFixed(0,HX_("ease",ee,8b,0c,43),::flixel::tweens::FlxEase_obj::quadIn_dyn())));
HXLINE( 154)		::flixel::tweens::FlxTween_obj::tween(this->txtTimer, ::Dynamic(hx::Anon_obj::Create(1)
            			->setFixed(0,HX_("y",79,00,00,00),(this->txtTimer->y + (int)165))),((Float)0.7), ::Dynamic(hx::Anon_obj::Create(1)
            			->setFixed(0,HX_("ease",ee,8b,0c,43),::flixel::tweens::FlxEase_obj::quadIn_dyn())));
HXLINE( 158)		this->super::create();
            	}


void MashState_obj::update(Float elapsed){
            	HX_STACKFRAME(&_hx_pos_f92e756756026210_162_update)
HXLINE( 163)		this->super::update(elapsed);
HXLINE( 166)		bool _hx_tmp;
HXDLIN( 166)		if ((this->_enemyHealth <= (int)0)) {
HXLINE( 166)			_hx_tmp = hx::IsNotEq( ::MashState_obj::outcome,::Outcome_obj::VICTORY_dyn() );
            		}
            		else {
HXLINE( 166)			_hx_tmp = false;
            		}
HXDLIN( 166)		if (_hx_tmp) {
HXLINE( 168)			::MashState_obj::outcome = ::Outcome_obj::VICTORY_dyn();
HXLINE( 169)			this->endTweens();
            		}
            		else {
HXLINE( 171)			bool _hx_tmp1;
HXDLIN( 171)			bool _hx_tmp2;
HXDLIN( 171)			if ((this->_enemyHealth <= (int)4)) {
HXLINE( 171)				_hx_tmp2 = (this->mashTimer < (int)0);
            			}
            			else {
HXLINE( 171)				_hx_tmp2 = false;
            			}
HXDLIN( 171)			if (_hx_tmp2) {
HXLINE( 171)				_hx_tmp1 = hx::IsNotEq( ::MashState_obj::outcome,::Outcome_obj::VICTORY_dyn() );
            			}
            			else {
HXLINE( 171)				_hx_tmp1 = false;
            			}
HXDLIN( 171)			if (_hx_tmp1) {
HXLINE( 173)				::MashState_obj::outcome = ::Outcome_obj::DEFEAT_dyn();
HXLINE( 174)				this->endTweens();
            			}
            			else {
HXLINE( 176)				bool _hx_tmp3;
HXDLIN( 176)				bool _hx_tmp4;
HXDLIN( 176)				if ((this->_enemyHealth > (int)0)) {
HXLINE( 176)					_hx_tmp4 = (this->mashTimer < (int)0);
            				}
            				else {
HXLINE( 176)					_hx_tmp4 = false;
            				}
HXDLIN( 176)				if (_hx_tmp4) {
HXLINE( 176)					_hx_tmp3 = hx::IsNotEq( ::MashState_obj::outcome,::Outcome_obj::VICTORY_dyn() );
            				}
            				else {
HXLINE( 176)					_hx_tmp3 = false;
            				}
HXDLIN( 176)				if (_hx_tmp3) {
HXLINE( 178)					::MashState_obj::outcome = ::Outcome_obj::ESCAPE_dyn();
HXLINE( 179)					this->endTweens();
            				}
            				else {
HXLINE( 183)					{
HXLINE( 183)						 ::flixel::FlxSprite _g = this->_enemySprite;
HXDLIN( 183)						_g->set_y((_g->y + ((Float)0.4)));
            					}
HXLINE( 184)					{
HXLINE( 184)						 ::flixel::text::FlxText _g1 = this->txtTimer;
HXDLIN( 184)						_g1->set_y((_g1->y + ((Float)0.39)));
            					}
HXLINE( 185)					 ::MashState _hx_tmp5 = hx::ObjectPtr<OBJ_>(this);
HXDLIN( 185)					_hx_tmp5->mashTimer = (_hx_tmp5->mashTimer - ::flixel::FlxG_obj::elapsed);
HXLINE( 186)					 ::flixel::text::FlxText _hx_tmp6 = this->txtTimer;
HXDLIN( 186)					_hx_tmp6->set_text(::Std_obj::string(::flixel::math::FlxMath_obj::roundDecimal(this->mashTimer,(int)2)));
HXLINE( 188)					if ((this->mashTimer < (int)0)) {
HXLINE( 190)						this->txtTimer->set_text(HX_("0.00",7e,4f,dd,1f));
            					}
            				}
            			}
            		}
HXLINE( 194)		if ((this->_enemyHealth <= (int)0)) {
HXLINE( 196)			this->_enemySprite->animation->play(HX_("stripped",f7,58,82,dd),null(),null(),null());
            		}
            	}


void MashState_obj::mash(){
            	HX_STACKFRAME(&_hx_pos_f92e756756026210_234_mash)
HXLINE( 235)		if ((::flixel::FlxG_obj::random->_hx_float((int)0,(int)100,null()) < (int)35)) {
HXLINE( 237)			 ::flixel::_hx_system::frontEnds::SoundFrontEnd _hx_tmp = ::flixel::FlxG_obj::sound;
HXDLIN( 237)			::String _hx_tmp1 = ((HX_("assets/sounds/Voice/Moan",ab,b0,b0,cb) + ::flixel::FlxG_obj::random->_hx_int((int)4,(int)17,null())) + HX_(".wav",be,71,c2,1e));
HXDLIN( 237)			_hx_tmp->play(_hx_tmp1,(::SettingState_obj::moanVol * ::SettingState_obj::masterVol),null(),null(),null(),null());
            		}
HXLINE( 244)		 ::flixel::_hx_system::frontEnds::SoundFrontEnd _hx_tmp2 = ::flixel::FlxG_obj::sound;
HXDLIN( 244)		::String _hx_tmp3 = ((HX_("assets/sounds/smack",70,de,d4,99) + ::flixel::FlxG_obj::random->_hx_int((int)1,(int)3,null())) + HX_(".ogg",e1,64,bc,1e));
HXDLIN( 244)		_hx_tmp2->play(_hx_tmp3,((((Float)0.3) * ::SettingState_obj::soundVol) * ::SettingState_obj::masterVol),null(),null(),null(),null());
HXLINE( 248)		 ::flixel::FlxCamera _hx_tmp4 = this->thisCam;
HXDLIN( 248)		Float _hx_tmp5 = ::flixel::FlxG_obj::random->_hx_float(((Float)0.05),((Float)0.025),null());
HXDLIN( 248)		_hx_tmp4->shake(_hx_tmp5,::flixel::FlxG_obj::random->_hx_float(((Float)0.05),((Float)0.2),null()),null(),null(),null());
HXLINE( 249)		this->_enemySprite->animation->play(HX_("hit",53,46,4f,00),null(),null(),null());
HXLINE( 255)		 ::MashState _hx_tmp6 = hx::ObjectPtr<OBJ_>(this);
HXDLIN( 255)		Float _hx_tmp7 = _hx_tmp6->_enemyHealth;
HXDLIN( 255)		_hx_tmp6->_enemyHealth = (_hx_tmp7 - ::flixel::FlxG_obj::random->_hx_float(((Float)0.8),((Float)2.3),null()));
HXLINE( 257)		this->mashX = !(this->mashX);
            	}


HX_DEFINE_DYNAMIC_FUNC0(MashState_obj,mash,(void))

void MashState_obj::endTweens(){
            	HX_STACKFRAME(&_hx_pos_f92e756756026210_262_endTweens)
HXDLIN( 262)		if (!(this->finishing)) {
HXLINE( 264)			this->finishing = true;
HXLINE( 265)			::flixel::tweens::FlxTween_obj::tween(this->_enemySprite, ::Dynamic(hx::Anon_obj::Create(1)
            				->setFixed(0,HX_("y",79,00,00,00),(::flixel::FlxG_obj::height + (int)400))),((Float)1.25), ::Dynamic(hx::Anon_obj::Create(1)
            				->setFixed(0,HX_("ease",ee,8b,0c,43),::flixel::tweens::FlxEase_obj::quartInOut_dyn())));
HXLINE( 266)			::flixel::tweens::FlxTween_obj::tween(this->txtTimer, ::Dynamic(hx::Anon_obj::Create(1)
            				->setFixed(0,HX_("y",79,00,00,00),(::flixel::FlxG_obj::height + (int)400))),((Float)1.4), ::Dynamic(hx::Anon_obj::Create(1)
            				->setFixed(0,HX_("ease",ee,8b,0c,43),::flixel::tweens::FlxEase_obj::quartInOut_dyn())));
HXLINE( 267)			::flixel::tweens::FlxTween_obj::tween(this->_mashSprite, ::Dynamic(hx::Anon_obj::Create(1)
            				->setFixed(0,HX_("y",79,00,00,00),(::flixel::FlxG_obj::height + (int)400))),((Float)0.75), ::Dynamic(hx::Anon_obj::Create(1)
            				->setFixed(0,HX_("ease",ee,8b,0c,43),::flixel::tweens::FlxEase_obj::quartInOut_dyn())));
HXLINE( 269)			::flixel::tweens::FlxTween_obj::tween(this->_barHealth, ::Dynamic(hx::Anon_obj::Create(1)
            				->setFixed(0,HX_("y",79,00,00,00),(int)-16)),((Float)0.65), ::Dynamic(hx::Anon_obj::Create(2)
            				->setFixed(0,HX_("ease",ee,8b,0c,43),::flixel::tweens::FlxEase_obj::quartInOut_dyn())
            				->setFixed(1,HX_("onComplete",f8,d4,7e,5d),this->finishTween_dyn())));
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC0(MashState_obj,endTweens,(void))

void MashState_obj::finishTween( ::flixel::tweens::FlxTween tween){
            	HX_STACKFRAME(&_hx_pos_f92e756756026210_276_finishTween)
HXLINE( 278)		::flixel::FlxG_obj::cameras->remove(this->thisCam,null());
HXLINE( 279)		this->close();
            	}


HX_DEFINE_DYNAMIC_FUNC1(MashState_obj,finishTween,(void))

 ::Outcome MashState_obj::outcome;


hx::ObjectPtr< MashState_obj > MashState_obj::__new(hx::Null< int >  __o_BGColor,int EType) {
	hx::ObjectPtr< MashState_obj > __this = new MashState_obj();
	__this->__construct(__o_BGColor,EType);
	return __this;
}

hx::ObjectPtr< MashState_obj > MashState_obj::__alloc(hx::Ctx *_hx_ctx,hx::Null< int >  __o_BGColor,int EType) {
	MashState_obj *__this = (MashState_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(MashState_obj), true, "MashState"));
	*(void **)__this = MashState_obj::_hx_vtable;
	__this->__construct(__o_BGColor,EType);
	return __this;
}

MashState_obj::MashState_obj()
{
}

void MashState_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(MashState);
	HX_MARK_MEMBER_NAME(enemyType,"enemyType");
	HX_MARK_MEMBER_NAME(_mashSprite,"_mashSprite");
	HX_MARK_MEMBER_NAME(_enemySprite,"_enemySprite");
	HX_MARK_MEMBER_NAME(_enemyHealth,"_enemyHealth");
	HX_MARK_MEMBER_NAME(thisCam,"thisCam");
	HX_MARK_MEMBER_NAME(mashX,"mashX");
	HX_MARK_MEMBER_NAME(maxShake,"maxShake");
	HX_MARK_MEMBER_NAME(mashTimer,"mashTimer");
	HX_MARK_MEMBER_NAME(txtTimer,"txtTimer");
	HX_MARK_MEMBER_NAME(_barHealth,"_barHealth");
	HX_MARK_MEMBER_NAME(finishing,"finishing");
	 ::flixel::FlxSubState_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void MashState_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(enemyType,"enemyType");
	HX_VISIT_MEMBER_NAME(_mashSprite,"_mashSprite");
	HX_VISIT_MEMBER_NAME(_enemySprite,"_enemySprite");
	HX_VISIT_MEMBER_NAME(_enemyHealth,"_enemyHealth");
	HX_VISIT_MEMBER_NAME(thisCam,"thisCam");
	HX_VISIT_MEMBER_NAME(mashX,"mashX");
	HX_VISIT_MEMBER_NAME(maxShake,"maxShake");
	HX_VISIT_MEMBER_NAME(mashTimer,"mashTimer");
	HX_VISIT_MEMBER_NAME(txtTimer,"txtTimer");
	HX_VISIT_MEMBER_NAME(_barHealth,"_barHealth");
	HX_VISIT_MEMBER_NAME(finishing,"finishing");
	 ::flixel::FlxSubState_obj::__Visit(HX_VISIT_ARG);
}

hx::Val MashState_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"mash") ) { return hx::Val( mash_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"mashX") ) { return hx::Val( mashX ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"create") ) { return hx::Val( create_dyn() ); }
		if (HX_FIELD_EQ(inName,"update") ) { return hx::Val( update_dyn() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"thisCam") ) { return hx::Val( thisCam ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"maxShake") ) { return hx::Val( maxShake ); }
		if (HX_FIELD_EQ(inName,"txtTimer") ) { return hx::Val( txtTimer ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"enemyType") ) { return hx::Val( enemyType ); }
		if (HX_FIELD_EQ(inName,"mashTimer") ) { return hx::Val( mashTimer ); }
		if (HX_FIELD_EQ(inName,"finishing") ) { return hx::Val( finishing ); }
		if (HX_FIELD_EQ(inName,"endTweens") ) { return hx::Val( endTweens_dyn() ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"_barHealth") ) { return hx::Val( _barHealth ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"_mashSprite") ) { return hx::Val( _mashSprite ); }
		if (HX_FIELD_EQ(inName,"finishTween") ) { return hx::Val( finishTween_dyn() ); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"_enemySprite") ) { return hx::Val( _enemySprite ); }
		if (HX_FIELD_EQ(inName,"_enemyHealth") ) { return hx::Val( _enemyHealth ); }
	}
	return super::__Field(inName,inCallProp);
}

bool MashState_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"outcome") ) { outValue = ( outcome ); return true; }
	}
	return false;
}

hx::Val MashState_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"mashX") ) { mashX=inValue.Cast< bool >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"thisCam") ) { thisCam=inValue.Cast<  ::flixel::FlxCamera >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"maxShake") ) { maxShake=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"txtTimer") ) { txtTimer=inValue.Cast<  ::flixel::text::FlxText >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"enemyType") ) { enemyType=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"mashTimer") ) { mashTimer=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"finishing") ) { finishing=inValue.Cast< bool >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"_barHealth") ) { _barHealth=inValue.Cast<  ::flixel::ui::FlxBar >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"_mashSprite") ) { _mashSprite=inValue.Cast<  ::flixel::FlxSprite >(); return inValue; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"_enemySprite") ) { _enemySprite=inValue.Cast<  ::flixel::FlxSprite >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_enemyHealth") ) { _enemyHealth=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

bool MashState_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"outcome") ) { outcome=ioValue.Cast<  ::Outcome >(); return true; }
	}
	return false;
}

void MashState_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("enemyType","\x22","\xf5","\x27","\xad"));
	outFields->push(HX_HCSTRING("_mashSprite","\xed","\x72","\x43","\x2e"));
	outFields->push(HX_HCSTRING("_enemySprite","\x6e","\xf6","\x51","\x11"));
	outFields->push(HX_HCSTRING("_enemyHealth","\x05","\x43","\xc2","\x4a"));
	outFields->push(HX_HCSTRING("thisCam","\x51","\xf4","\x20","\x2e"));
	outFields->push(HX_HCSTRING("mashX","\x4f","\x8b","\x22","\x03"));
	outFields->push(HX_HCSTRING("maxShake","\x82","\x31","\x3a","\x26"));
	outFields->push(HX_HCSTRING("mashTimer","\x1c","\x02","\x8c","\x63"));
	outFields->push(HX_HCSTRING("txtTimer","\x35","\x6b","\xb4","\x6d"));
	outFields->push(HX_HCSTRING("_barHealth","\x90","\x6a","\x53","\x7e"));
	outFields->push(HX_HCSTRING("finishing","\x6f","\x82","\xb5","\xd7"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo MashState_obj_sMemberStorageInfo[] = {
	{hx::fsInt,(int)offsetof(MashState_obj,enemyType),HX_HCSTRING("enemyType","\x22","\xf5","\x27","\xad")},
	{hx::fsObject /*::flixel::FlxSprite*/ ,(int)offsetof(MashState_obj,_mashSprite),HX_HCSTRING("_mashSprite","\xed","\x72","\x43","\x2e")},
	{hx::fsObject /*::flixel::FlxSprite*/ ,(int)offsetof(MashState_obj,_enemySprite),HX_HCSTRING("_enemySprite","\x6e","\xf6","\x51","\x11")},
	{hx::fsFloat,(int)offsetof(MashState_obj,_enemyHealth),HX_HCSTRING("_enemyHealth","\x05","\x43","\xc2","\x4a")},
	{hx::fsObject /*::flixel::FlxCamera*/ ,(int)offsetof(MashState_obj,thisCam),HX_HCSTRING("thisCam","\x51","\xf4","\x20","\x2e")},
	{hx::fsBool,(int)offsetof(MashState_obj,mashX),HX_HCSTRING("mashX","\x4f","\x8b","\x22","\x03")},
	{hx::fsFloat,(int)offsetof(MashState_obj,maxShake),HX_HCSTRING("maxShake","\x82","\x31","\x3a","\x26")},
	{hx::fsFloat,(int)offsetof(MashState_obj,mashTimer),HX_HCSTRING("mashTimer","\x1c","\x02","\x8c","\x63")},
	{hx::fsObject /*::flixel::text::FlxText*/ ,(int)offsetof(MashState_obj,txtTimer),HX_HCSTRING("txtTimer","\x35","\x6b","\xb4","\x6d")},
	{hx::fsObject /*::flixel::ui::FlxBar*/ ,(int)offsetof(MashState_obj,_barHealth),HX_HCSTRING("_barHealth","\x90","\x6a","\x53","\x7e")},
	{hx::fsBool,(int)offsetof(MashState_obj,finishing),HX_HCSTRING("finishing","\x6f","\x82","\xb5","\xd7")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo MashState_obj_sStaticStorageInfo[] = {
	{hx::fsObject /*::Outcome*/ ,(void *) &MashState_obj::outcome,HX_HCSTRING("outcome","\x92","\xb8","\xcf","\xdb")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static ::String MashState_obj_sMemberFields[] = {
	HX_HCSTRING("enemyType","\x22","\xf5","\x27","\xad"),
	HX_HCSTRING("_mashSprite","\xed","\x72","\x43","\x2e"),
	HX_HCSTRING("_enemySprite","\x6e","\xf6","\x51","\x11"),
	HX_HCSTRING("_enemyHealth","\x05","\x43","\xc2","\x4a"),
	HX_HCSTRING("thisCam","\x51","\xf4","\x20","\x2e"),
	HX_HCSTRING("mashX","\x4f","\x8b","\x22","\x03"),
	HX_HCSTRING("maxShake","\x82","\x31","\x3a","\x26"),
	HX_HCSTRING("mashTimer","\x1c","\x02","\x8c","\x63"),
	HX_HCSTRING("txtTimer","\x35","\x6b","\xb4","\x6d"),
	HX_HCSTRING("_barHealth","\x90","\x6a","\x53","\x7e"),
	HX_HCSTRING("finishing","\x6f","\x82","\xb5","\xd7"),
	HX_HCSTRING("create","\xfc","\x66","\x0f","\x7c"),
	HX_HCSTRING("update","\x09","\x86","\x05","\x87"),
	HX_HCSTRING("mash","\xe9","\x40","\x56","\x48"),
	HX_HCSTRING("endTweens","\xe3","\xc1","\x06","\x69"),
	HX_HCSTRING("finishTween","\x18","\xcd","\x75","\x40"),
	::String(null()) };

static void MashState_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(MashState_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(MashState_obj::outcome,"outcome");
};

#ifdef HXCPP_VISIT_ALLOCS
static void MashState_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(MashState_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(MashState_obj::outcome,"outcome");
};

#endif

hx::Class MashState_obj::__mClass;

static ::String MashState_obj_sStaticFields[] = {
	HX_HCSTRING("outcome","\x92","\xb8","\xcf","\xdb"),
	::String(null())
};

void MashState_obj::__register()
{
	hx::Object *dummy = new MashState_obj;
	MashState_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("MashState","\x48","\x98","\x34","\x79");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &MashState_obj::__GetStatic;
	__mClass->mSetStaticField = &MashState_obj::__SetStatic;
	__mClass->mMarkFunc = MashState_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(MashState_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(MashState_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< MashState_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = MashState_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = MashState_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = MashState_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void MashState_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_f92e756756026210_22_boot)
HXDLIN(  22)		outcome = ::Outcome_obj::NONE_dyn();
            	}
}

