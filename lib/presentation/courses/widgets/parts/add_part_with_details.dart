import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/core/firebase/function/courses/course_models.dart';
import 'package:cyberbee_web/presentation/courses/widgets/parts/dif_parts/exam.dart';
import 'package:cyberbee_web/presentation/courses/widgets/parts/dif_parts/pdf.dart';
import 'package:cyberbee_web/presentation/courses/widgets/parts/dif_parts/videos.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddPartToLevelInputScreen extends StatelessWidget {
  AddPartToLevelInputScreen({
    super.key,
    required this.course,
    required this.levelNo,
    required this.part,
  }) {
    late PartType type;
    switch (part?['type']) {
      case 'pdf':
        type = PartType.pdf;
        break;
      case 'exam':
        type = PartType.exam;
        break;
      default:
        type = PartType.video;
        break;
    }
    _partName = TextEditingController(text: part?['partName']);
    _partNo = TextEditingController(text: part?.id);
    _description = TextEditingController(text: part?['description']);
    _type = ValueNotifier<PartType>(type);
  }
  final String course;
  final String levelNo;
  late TextEditingController _partName;
  late TextEditingController _partNo;
  late TextEditingController _description;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ValueNotifier<PartType> _type;
  final QueryDocumentSnapshot? part;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextFormField(
              controller: _partName,
              hintText: 'Enter the name of the part',
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller: _partNo,
              hintText: 'Enter the Number in order of the part',
              isNumOnly: true,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'Part Number is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller: _description,
              hintText: 'Description',
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'Description is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownMenu(
              dropdownMenuEntries: const [
                DropdownMenuEntry(
                  value: PartType.video,
                  label: 'Video',
                ),
                DropdownMenuEntry(
                  value: PartType.pdf,
                  label: 'PDF',
                ),
                DropdownMenuEntry(
                  value: PartType.exam,
                  label: 'Exam',
                ),
              ],
              onSelected: (value) => _type.value = value ?? PartType.video,
              initialSelection: PartType.video,
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder(
              valueListenable: _type,
              builder: (_, value, __) {
                switch (value) {
                  case PartType.exam:
                    return const PartExamAddWidget();
                  case PartType.pdf:
                    return PartPdfAddWidget(
                      partName: _partName,
                      descripition: _description,
                      partNo: _partNo,
                      courseName: course,
                      levelName: levelNo,
                    );
                  default:
                    return PartVideoAddWidget(
                      partName: _partName,
                      descripition: _description,
                      partNo: _partNo,
                      courseName: course,
                      levelName: levelNo,
                    );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
