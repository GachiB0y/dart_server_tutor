//
//  Generated code. Do not modify.
//  source: dart_server.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use studentDescriptor instead')
const Student$json = {
  '1': 'Student',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Student`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List studentDescriptor = $convert.base64Decode(
    'CgdTdHVkZW50Eg4KAmlkGAEgASgFUgJpZBISCgRuYW1lGAIgASgJUgRuYW1l');

@$core.Deprecated('Use questionDescriptor instead')
const Question$json = {
  '1': 'Question',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `Question`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List questionDescriptor = $convert.base64Decode(
    'CghRdWVzdGlvbhIOCgJpZBgBIAEoBVICaWQSEgoEdGV4dBgCIAEoCVIEdGV4dA==');

@$core.Deprecated('Use answerDescriptor instead')
const Answer$json = {
  '1': 'Answer',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'student', '3': 2, '4': 1, '5': 11, '6': '.Student', '10': 'student'},
    {'1': 'question', '3': 3, '4': 1, '5': 11, '6': '.Question', '10': 'question'},
    {'1': 'text', '3': 4, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `Answer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List answerDescriptor = $convert.base64Decode(
    'CgZBbnN3ZXISDgoCaWQYASABKAVSAmlkEiIKB3N0dWRlbnQYAiABKAsyCC5TdHVkZW50UgdzdH'
    'VkZW50EiUKCHF1ZXN0aW9uGAMgASgLMgkuUXVlc3Rpb25SCHF1ZXN0aW9uEhIKBHRleHQYBCAB'
    'KAlSBHRleHQ=');

@$core.Deprecated('Use evaluationDescriptor instead')
const Evaluation$json = {
  '1': 'Evaluation',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'answerId', '3': 2, '4': 1, '5': 5, '10': 'answerId'},
    {'1': 'mark', '3': 3, '4': 1, '5': 5, '10': 'mark'},
  ],
};

/// Descriptor for `Evaluation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List evaluationDescriptor = $convert.base64Decode(
    'CgpFdmFsdWF0aW9uEg4KAmlkGAEgASgFUgJpZBIaCghhbnN3ZXJJZBgCIAEoBVIIYW5zd2VySW'
    'QSEgoEbWFyaxgDIAEoBVIEbWFyaw==');

@$core.Deprecated('Use answeredQuestionDescriptor instead')
const AnsweredQuestion$json = {
  '1': 'AnsweredQuestion',
  '2': [
    {'1': 'question', '3': 1, '4': 1, '5': 11, '6': '.Question', '10': 'question'},
    {'1': 'answer', '3': 2, '4': 1, '5': 9, '10': 'answer'},
  ],
};

/// Descriptor for `AnsweredQuestion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List answeredQuestionDescriptor = $convert.base64Decode(
    'ChBBbnN3ZXJlZFF1ZXN0aW9uEiUKCHF1ZXN0aW9uGAEgASgLMgkuUXVlc3Rpb25SCHF1ZXN0aW'
    '9uEhYKBmFuc3dlchgCIAEoCVIGYW5zd2Vy');

@$core.Deprecated('Use examDescriptor instead')
const Exam$json = {
  '1': 'Exam',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'questions', '3': 2, '4': 3, '5': 11, '6': '.Question', '10': 'questions'},
  ],
};

/// Descriptor for `Exam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List examDescriptor = $convert.base64Decode(
    'CgRFeGFtEg4KAmlkGAEgASgFUgJpZBInCglxdWVzdGlvbnMYAiADKAsyCS5RdWVzdGlvblIJcX'
    'Vlc3Rpb25z');

@$core.Deprecated('Use interviewMessageDescriptor instead')
const InterviewMessage$json = {
  '1': 'InterviewMessage',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'body', '3': 2, '4': 1, '5': 9, '10': 'body'},
  ],
};

/// Descriptor for `InterviewMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List interviewMessageDescriptor = $convert.base64Decode(
    'ChBJbnRlcnZpZXdNZXNzYWdlEhIKBG5hbWUYASABKAlSBG5hbWUSEgoEYm9keRgCIAEoCVIEYm'
    '9keQ==');

