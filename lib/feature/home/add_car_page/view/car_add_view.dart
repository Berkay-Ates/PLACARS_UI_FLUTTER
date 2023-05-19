import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/extension/easy_localization_translate/easy_localization_translate.dart';
import '../view_model/car_add_view_model.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/placars_button_widget.dart';
import '../../../../core/components/placars_icon_button.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/theme/itheme/iTheme.dart';

class CarAddView extends StatelessWidget {
  const CarAddView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<CarrAddViewModel>(
      viewModel: CarrAddViewModel(),
      onModelReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          key: viewModel.scaffoldKey,
          backgroundColor: ITheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: ITheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: PlacarsIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.chevron_left_rounded,
                color: ITheme.of(context).secondaryText,
                size: 30.0,
              ),
              onPressed: () async {
                Navigator.pop(context, false);
              },
            ),
            title: Text(
              LocaleKeys.add_car_page_appbar.translate,
              style: ITheme.of(context).headlineMedium,
            ),
            actions: const [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: viewModel.plakaController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: LocaleKeys.add_car_page_plate_txt.translate,
                              labelStyle: ITheme.of(context).bodySmall,
                              hintText: LocaleKeys.add_car_page_plate_txt.translate,
                              hintStyle: ITheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: ITheme.of(context).secondaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                            ),
                            style: ITheme.of(context).bodyMedium,
                            validator: viewModel.textFieldsValidator,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: viewModel.markaModelController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: LocaleKeys.add_car_page_brand_txt.translate,
                              labelStyle: ITheme.of(context).bodySmall,
                              hintText: LocaleKeys.add_car_page_brand_txt.translate,
                              hintStyle: ITheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: ITheme.of(context).secondaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                            ),
                            style: ITheme.of(context).bodyMedium,
                            validator: viewModel.textFieldsValidator,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: viewModel.kmTextController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: LocaleKeys.add_car_page_km_txt.translate,
                              labelStyle: ITheme.of(context).bodySmall,
                              hintText: LocaleKeys.add_car_page_km_txt.translate,
                              hintStyle: ITheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: ITheme.of(context).secondaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                            ),
                            style: ITheme.of(context).bodyMedium,
                            keyboardType: TextInputType.number,
                            validator: viewModel.textFieldsValidator,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: viewModel.descriptionTextController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: LocaleKeys.add_car_page_description_txt.translate,
                              labelStyle: ITheme.of(context).bodySmall,
                              hintText: LocaleKeys.add_car_page_km_txt.translate,
                              hintStyle: ITheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: ITheme.of(context).secondaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                            ),
                            maxLines: 5,
                            style: ITheme.of(context).bodyMedium,
                            keyboardType: TextInputType.text,
                            validator: viewModel.textFieldsValidator,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-0.95, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(3.0),
                                        ),
                                      ),
                                      unselectedWidgetColor: const Color(0xFFFF7B7B),
                                    ),
                                    child: Observer(builder: (_) {
                                      return Checkbox(
                                        value: viewModel.checkboxValue,
                                        onChanged: (newValue) {
                                          viewModel.changeCarSaleCheckboxValue(newValue);
                                        },
                                        activeColor: ITheme.of(context).primary,
                                      );
                                    }),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  LocaleKeys.add_car_page_car_sale.translate,
                                  style: ITheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                              child: Text(
                                LocaleKeys.add_car_page_car_license.translate,
                                style: ITheme.of(context).bodyMedium.copyWith(
                                      fontFamily: 'Lexend',
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 240.0,
                              decoration: BoxDecoration(
                                color: ITheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  // ruhsatYukle
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: ITheme.of(context).primaryBackground,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: PlacarsIconButton(
                                        borderRadius: 0.0,
                                        borderWidth: 0.0,
                                        buttonSize: 60.0,
                                        icon: Icon(
                                          Icons.add,
                                          color: ITheme.of(context).primaryText,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          // license
                                          final url = await viewModel.uploadImageToFirebase();
                                          viewModel.setLicenceUrl(url ?? "");
                                        },
                                      ),
                                    ),
                                    Text(
                                      LocaleKeys.add_car_page_add_license.translate,
                                      textAlign: TextAlign.center,
                                      style: ITheme.of(context).bodyMedium,
                                    ),
                                    Observer(builder: (_) {
                                      return SizedBox(
                                        height: 120,
                                        child: Image.network(viewModel.licencePlateUrl),
                                      );
                                    })
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                              child: Text(
                                LocaleKeys.add_car_page_car_photo.translate,
                                style: ITheme.of(context).bodyMedium.copyWith(
                                      fontFamily: 'Lexend',
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 240.0,
                              decoration: BoxDecoration(
                                color: ITheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  // aracFotoYukle
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: ITheme.of(context).primaryBackground,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: PlacarsIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 0.0,
                                        borderWidth: 0.0,
                                        buttonSize: 60.0,
                                        icon: Icon(
                                          Icons.add,
                                          color: ITheme.of(context).primaryText,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          final url = await viewModel.uploadImageToFirebase();
                                          viewModel.setCarUrl(url ?? "");
                                        },
                                      ),
                                    ),
                                    Text(
                                      LocaleKeys.add_car_page_add_car_photo.translate,
                                      textAlign: TextAlign.center,
                                      style: ITheme.of(context).bodyMedium,
                                    ),
                                    Observer(builder: (_) {
                                      return SizedBox(
                                        height: 120,
                                        child: Image.network(viewModel.carUrl),
                                      );
                                    })
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 60.0),
                          child: PlacarsButtonWidget(
                            onPressed: () async {
                              try {
                                await viewModel.addCar();
                              } catch (e) {
                                inspect(e);
                                viewModel.showSnackSError();
                              }
                            },
                            text: LocaleKeys.add_car_page_send_btn.translate,
                            options: PlacarsButtonOptions(
                              width: 190.0,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              color: ITheme.of(context).primary,
                              textStyle: ITheme.of(context).titleSmall.copyWith(
                                    fontFamily: 'Lexend',
                                    color: ITheme.of(context).textColor,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      onDispose: (viewModel) => viewModel.dispose(),
    );
  }
}
