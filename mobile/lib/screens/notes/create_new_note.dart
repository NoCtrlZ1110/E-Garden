import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/core/services/note/note_model.service.dart';
import 'package:e_garden/widgets/static_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CreateNewTaskPage extends StatefulWidget {
  @override
  _CreateNewTaskPageState createState() => _CreateNewTaskPageState(noteId);
  final int noteId;

  const CreateNewTaskPage(this.noteId);
}

class _CreateNewTaskPageState extends State<CreateNewTaskPage> {
  int noteId;
  GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  _CreateNewTaskPageState(this.noteId);

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteModel>(builder: (_, notes, __) {
      return Scaffold(
        backgroundColor: AppColors.green,
        appBar: staticAppbar(title: "Create new note"),
        body: Stack(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg_screen.png"),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0)),
              ),
            ),
            Column(
              children: [
                Expanded(
                    child: noteId != 0
                        ? FutureBuilder(
                            future: notes.fetchNoteDetail(noteId),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              if (snapshot.hasError) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              if (snapshot.hasData) {
                                return _getBody();
                              }
                              return Center(child: CircularProgressIndicator());
                            })
                        : _getBody())
              ],
            )
          ],
        ),
        bottomNavigationBar: Container(
          height: SizeConfig.safeBlockHorizontal * 15,
          color: Color(0xFFF4F4F4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig.safeBlockHorizontal * 22,
                    height: SizeConfig.safeBlockVertical * 5,
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.safeBlockVertical * 1.8),
                    ),
                  ),
                  color: Color(0xFFE3161D),
                  onPressed: () async {
                    if (_fbKey.currentState.saveAndValidate()) {
                      if (await notes.createNote(_fbKey.currentState.value)) {
                        Fluttertoast.showToast(
                          msg: "Thành công",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        Navigator.pop(context);
                      }
                    } else {
                      Fluttertoast.showToast(
                        msg: "Thiếu thông tin",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  },
                ),
                RaisedButton(
                    child: Container(
                      alignment: Alignment.center,
                      width: SizeConfig.safeBlockHorizontal * 22,
                      height: SizeConfig.safeBlockVertical * 5,
                      child: Text(
                        'Close',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.safeBlockVertical * 1.8),
                      ),
                    ),
                    color: Color(0xFF464646),
                    onPressed: () {
                      if (true) {}
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _getBody() {
    return SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: FormBuilder(
          key: _fbKey,
          child: Column(
            children: [
              FormBuilderTextField(
                  attribute: 'title',
                  decoration: InputDecoration(labelText: "Title"),
                  maxLines: 1),
              SizedBox(height: 10.0),
              FormBuilderDateTimePicker(
                attribute: "activity_date",
                inputType: InputType.date,
                initialValue: DateTime.now(),
                // initialValue: (widget.cubit.deliveryById.deliveryInput.date == null)
                //     ? null
                //     : DateTime.parse("${widget.cubit.deliveryById.deliveryInput.date}"),
                validators: [FormBuilderValidators.required()],
                format: DateFormat("dd-MM-yyyy"),
                decoration: InputDecoration(labelText: "Activity Date"),
                onChanged: (value) {
                  //widget.cubit.delivery.deliveryInput.date = value.toString();
                },
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: FormBuilderDateTimePicker(
                    attribute: "time_from",
                    initialTime: TimeOfDay(hour: 8, minute: 0),
                    inputType: InputType.time,
                    // initialValue: (widget.cubit.deliveryById.deliveryInput.startTime == null)
                    //     ? null
                    //     : Time.fromString(widget.cubit.deliveryById.deliveryInput.startTime).toDateTime(),
                    decoration: InputDecoration(labelText: "Start Time"),
                    validators: [FormBuilderValidators.required()],
                  )),
                  SizedBox(width: SizeConfig.safeBlockHorizontal * 8),
                  Expanded(
                    child: FormBuilderDateTimePicker(
                      attribute: "time_to",
                      initialTime: TimeOfDay(hour: 8, minute: 0),
                      decoration: InputDecoration(labelText: "End Time"),
                      inputType: InputType.time,
                      // initialValue: (widget.cubit.deliveryById.deliveryInput.endTime == null)
                      //     ? null
                      //     : Time.fromString(widget.cubit.deliveryById.deliveryInput.endTime).toDateTime(),
                      validators: [FormBuilderValidators.required()],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              FormBuilderTextField(
                attribute: "note_detail",
                // initialValue: cubit.activityById.financeProduct,
                decoration: InputDecoration(labelText: "Note Detail"),
                maxLines: null,
              ),
              SizedBox(height: 10.0),
              FormBuilderDropdown(
                attribute: "status",
                // initialValue: cubit.activityId != null && cubit.activityById.status != null
                //     ? cubit.statusMap[cubit.activityById.status]
                //     : null,
                decoration: InputDecoration(labelText: "Status"),
                items: ["Done", "Not Done"]
                    .map((data) =>
                        DropdownMenuItem(child: Text("$data"), value: data))
                    .toList(),
                //onChanged: (dynamic val) => cubit.changeStatus(val as String),
              ),
              SizedBox(height: 10.0),
              FormBuilderColorPicker(
                attribute: 'color_picker',
                initialValue: Colors.white,
                style: Theme.of(context).textTheme.bodyText1,
                colorPickerType: ColorPickerType.BlockPicker,
                decoration: InputDecoration(
                  labelText: 'Pick color note',
                  labelStyle: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ));
  }
}
