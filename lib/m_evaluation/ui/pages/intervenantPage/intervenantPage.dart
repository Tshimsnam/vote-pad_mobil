// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import '../../../../navigation/routers.dart';
// import '../../composants/ListeVide.dart';
// import 'intervenantCtrl.dart';
//
// class IntervenantPage extends ConsumerStatefulWidget {
//
//   final int phaseId;
//   const IntervenantPage( {super.key,required this.phaseId});
//   @override
//   ConsumerState<IntervenantPage> createState() => _IntervenantState();
// }
//
// class _IntervenantState extends ConsumerState<IntervenantPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       var ctrl = ref.read(intervenantCtrlProvider.notifier);
//       ctrl.recupererListIntervenant(widget.phaseId);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var state = ref.watch(intervenantCtrlProvider);
//     var phaseId=widget.phaseId;
//     return Scaffold(
//         body: SafeArea(
//           child: Stack(
//             children: [
//               if (state.intervenantsOrigin.isEmpty && !state.isLoading)
//                 ListeVide(context, () {
//                   var ctrl = ref.read(intervenantCtrlProvider.notifier);
//                   ctrl.recupererListIntervenant(phaseId);
//                 })
//               else
//                 _contenuPrincipale(context, ref),
//               _chargement(context, ref),
//             ],
//           ),
//         ),
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           leading: Container(
//             child: IconButton(
//                 onPressed: () {
//                   context.goNamed(Urls.phases.name);
//                 },
//                 icon: Icon(Icons.arrow_back_ios_new_rounded)),
//           ),
//           title: Text("Intervenants"),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                  // context.goNamed(Urls.Intro.name);
//                 },
//                 icon: Icon(Icons.menu_rounded)),
//           ],
//         ));
//   }
//
//   _contenuPrincipale(BuildContext context, WidgetRef ref) {
//     var state = ref.watch(intervenantCtrlProvider);
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 10.0),
//             child: _zoneDeRecherche(context),
//           ),
//           Expanded(
//               child: ListView.separated(
//                   separatorBuilder: (ctx, index) {
//                     return Divider(
//                       thickness: 1,
//                     );
//                   },
//                   itemCount: state.intervenants.length,
//                   itemBuilder: (ctx, index) {
//                     var intervenant = state.intervenants[index];
//                     return Card(
//                         color: Colors.transparent,
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         child:
//                         ListTile(
//                             leading: Icon(Icons.person),
//                             trailing: (intervenant.isDone)?
//                     Icon(Icons.check_sharp,color: Colors.green,):
//                     Icon(Icons.arrow_forward),
//                      onTap: () {
//                       context.pushNamed(Urls.vote.name,
//                       pathParameters: {"phaseId":widget.phaseId.toString(),
//                         "intervenantId":intervenant.intervenantId.toString()});
//                     },
//                         title: Text(intervenant.email),)
//                     );
//                   }))
//         ],
//       ),
//     );
//   }
//
//   _zoneDeRecherche(BuildContext context) {
//     return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           TextFormField(
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.grey.shade200,
//               suffixIcon: Icon(Icons.search),
//               hintText: 'Recherche',
//             ),
//             onChanged: (value) {
//               var ctrl = ref.read(intervenantCtrlProvider.notifier);
//               ctrl.rechercherIntervenant(value);
//               print(value);
//             },
//           ),
//         ]);
//   }
//
//
//   _chargement(BuildContext context, WidgetRef ref) {
//     var state = ref.watch(intervenantCtrlProvider);
//     return Visibility(
//         visible: state.isLoading,
//         child: Center(child: CircularProgressIndicator()));
//   }
// }
