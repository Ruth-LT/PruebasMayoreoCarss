import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/fonts.dart';
import '../app/text_styles.dart';

import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';
import '../services/url_service.dart';
import '../widgets/contact_info_list_tile.dart';
import '../widgets/text_field.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({Key key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  String urlSucursal;
  String sucursalTitulo;
  String telefono1;
  String telefono2;
  String telefono3;
  String whatsapp;
  String correo;
  String direccion;
  String maps;

  SharedPreferences preffs;

  @override
  initState(){
    super.initState();

    _getImage();
  }


  _getImage() async {
    preffs = await SharedPreferences.getInstance();
    int sucursal = 0;
    sucursal = int.parse(preffs.getString("sucursal"))!=null ? int.parse(preffs.getString("sucursal")) : 1;
    print('SUCURSAL:::: $sucursal');
    switch (sucursal) {
      case 1:
        {
          setState(() {
            urlSucursal =
            "https://aichisa.com.mx/images/SUCURSALES/matriz.jpeg";
            sucursalTitulo = "Chihuahua";
            telefono1 = '(614) 417 59 00';
            telefono2 = '(614) 419 69 11';
            telefono3 = '(614) 417 92 64';
            whatsapp = '(614) 385 60 59';
            correo = '';
            direccion = 'Av. De la Juventud 9537, Residencial Universidad, 31125 Chihuhaua, Chih.';
            maps = 'https://goo.gl/maps/6KzusPnVZG9h9uqy8';
          });
        }
        break;

      case 4:
        {
          setState(() {
            urlSucursal =
            "https://aichisa.com.mx/images/SUCURSALES/juarez.jpeg";
            sucursalTitulo = "Juarez";
            telefono1 = '(656) 897 33 31';
            telefono2 = '(656) 897 33 30';
            telefono3 = '';
            whatsapp = '(656) 385 60 59';
            correo = '';
            direccion = 'Carretera Panamericana 8901, CP. 32695, Ciudad Juarez, Chihuahua, Mexico';
            maps = 'https://goo.gl/maps/mnKiBAZ4qHqyNYz89';
          });
        }
        break;

      case 5:
        {
          setState(() {
            urlSucursal =
            "https://aichisa.com.mx/images/SUCURSALES/torreon.jpeg";
            sucursalTitulo = "Torreon";
            telefono1 = '(871) 209 63 93';
            telefono2 = '(871) 209 60 90';
            telefono3 = '';
            whatsapp = '(614) 385 60 59';
            correo = '';
            direccion = 'Carretera Torreon-Matamoros Col. Oscar Flores Tapia CP. 27086, Torreon, Coahuila';
            maps = 'https://goo.gl/maps/mSxRxKzni646n4wF6';
          });
        }
        break;

      case 6:
        {
          setState(() {
            urlSucursal =
            "https://aichisa.com.mx/images/SUCURSALES/hermosillo.jpeg";
            sucursalTitulo = "Hermosillo";
            telefono1 = '(662) 285 13 20';
            telefono2 = '(662) 215 49 65';
            telefono3 = '(662) 301 87 05';
            whatsapp = '';
            correo = '';
            direccion = 'Blvd. José Maria Escriba De Balaguer 160, CP. 83105 Hermosillo, Sonora, Mexico';
            maps = 'https://goo.gl/maps/DzFoDNuWxKg2g8Pi8';
          });
        }
        break;

      default:
        {
          urlSucursal =
          "https://aichisa.com.mx/images/SUCURSALES/matriz.jpeg";
          sucursalTitulo = "Chihuahua";
          telefono1 = '(614) 417 59 00';
          telefono2 = '(614) 419 69 11';
          telefono3 = '(614) 417 92 64';
          whatsapp = '(614) 385 60 59';
          correo = '';
          direccion = 'Av. De la Juventud 9537, Residencial Universidad, 31125 Chihuhaua, Chih.';
          maps = 'https://goo.gl/maps/6KzusPnVZG9h9uqy8';
        }
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'CONTACTO',
                style: SectionTitle.h2(context),
                textAlign: TextAlign.center,
              ),
              Text(
                'Si tienes alguna duda o requieres mas información, contactanos!',
                style: SectionTitle.p(context),
                textAlign: TextAlign.center,
              ).container(padding: const EdgeInsets.only(top: 10, bottom: 20)),
            ],
          ),
          NextRow(children: [
            NextCol(
                sizes: 'col-12 col-lg-6 col-md-12',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                          UrlService.launchUrl(maps);

                      },
                      child: ContactListTile(
                          title: sucursalTitulo,
                          subtitle:
                              direccion,
                          leadingIcon: LineIcons.locationArrow),
                    ),
                    if(correo!= '')
                    InkWell(
                      onTap: (){
                        UrlService.launchUrl('mailto:${correo}');

                      },
                      child: ContactListTile(
                          title: 'Email:',
                          subtitle: correo,
                          leadingIcon: LineIcons.whatSApp),
                    ),
                    if(telefono1!= '')

                      InkWell(
                      onTap: (){
                        UrlService.launchUrl('tel:+52${telefono1.replaceAll(" ", "").replaceAll("(", "").replaceAll(')', "")}');

                      },
                      child: ContactListTile(
                          title: 'Telefono:',
                          subtitle: '01 $telefono1',
                          leadingIcon: Icons.mobile_friendly_rounded),
                    ),
                    if(telefono2!= '')
                      InkWell(
                      onTap: (){
                        UrlService.launchUrl('tel:+52${telefono2.replaceAll(" ", "").replaceAll("(", "").replaceAll(')', "")}');

                      },
                      child: ContactListTile(
                          title: 'Telefono:',
                          subtitle: '01 $telefono2',
                          leadingIcon: Icons.mobile_friendly_rounded),
                    ),
                    if(telefono3!= '')
                      InkWell(
                      onTap: (){
                        UrlService.launchUrl('tel:+52${telefono3.replaceAll(" ", "").replaceAll("(", "").replaceAll(')', "")}');

                      },
                      child: ContactListTile(
                          title: 'Telefono:',
                          subtitle: '01 $telefono3',
                          leadingIcon: Icons.mobile_friendly_rounded),
                    ),
                    if(whatsapp!= '')
                      InkWell(
                      onTap: (){
                        UrlService.launchUrl('https://wa.me/+52${whatsapp.replaceAll(" ", "").replaceAll("(", "").replaceAll(')', "")}');

                      },
                      child: ContactListTile(
                          title: 'WhatsApp:',
                          subtitle: '01 $whatsapp',
                          leadingIcon: LineIcons.whatSApp),
                    ),

                  ],
                )),
            NextCol(
                sizes: 'col-12 col-lg-6 col-md-12',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Image.network(
                          urlSucursal,
                         fit: BoxFit.contain,),

                  ],
                )),
          ])
        ],
      ).container(
          padding: EdgeInsets.symmetric(
              vertical: 60, horizontal: context.isMobile ? 20 : 60)),
    );
  }
}
