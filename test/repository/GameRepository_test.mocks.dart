// Mocks generated by Mockito 5.4.2 from annotations
// in cocoon_kids_flutter/test/repository/GameRepository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cocoon_kids_flutter/models/children_data.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEmotionDataForAge_0 extends _i1.SmartFake
    implements _i2.EmotionDataForAge {
  _FakeEmotionDataForAge_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Emotion].
///
/// See the documentation for Mockito's code generation for more information.
class MockEmotion extends _i1.Mock implements _i2.Emotion {
  MockEmotion() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: 0,
      ) as int);
  @override
  set id(int? _id) => super.noSuchMethod(
        Invocation.setter(
          #id,
          _id,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get name => (super.noSuchMethod(
        Invocation.getter(#name),
        returnValue: '',
      ) as String);
  @override
  set name(String? _name) => super.noSuchMethod(
        Invocation.setter(
          #name,
          _name,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get restricted => (super.noSuchMethod(
        Invocation.getter(#restricted),
        returnValue: false,
      ) as bool);
  @override
  set restricted(bool? _restricted) => super.noSuchMethod(
        Invocation.setter(
          #restricted,
          _restricted,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.EmotionDataForAge get under13 => (super.noSuchMethod(
        Invocation.getter(#under13),
        returnValue: _FakeEmotionDataForAge_0(
          this,
          Invocation.getter(#under13),
        ),
      ) as _i2.EmotionDataForAge);
  @override
  set under13(_i2.EmotionDataForAge? _under13) => super.noSuchMethod(
        Invocation.setter(
          #under13,
          _under13,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.EmotionDataForAge get over13 => (super.noSuchMethod(
        Invocation.getter(#over13),
        returnValue: _FakeEmotionDataForAge_0(
          this,
          Invocation.getter(#over13),
        ),
      ) as _i2.EmotionDataForAge);
  @override
  set over13(_i2.EmotionDataForAge? _over13) => super.noSuchMethod(
        Invocation.setter(
          #over13,
          _over13,
        ),
        returnValueForMissingStub: null,
      );
}