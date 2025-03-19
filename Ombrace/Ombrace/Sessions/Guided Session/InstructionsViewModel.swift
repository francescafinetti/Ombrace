//
//  InstructionsViewModel.swift
//  challenge5
//
//  Created by Serena Pia Capasso on 05/03/25.
//





//ho cambiato un po di cose per far andare la durata diversa per ogni lingua, ma non prende le durate per le altre lingue - in INGLESE DURATION VA BENE.
//non ho provato se francese e spagnolo vanno bene

import SwiftUI
import Foundation

@Observable
class InstructionViewModel {

       private func getCurrentLanguage() -> String {
           let preferredLanguage = Locale.preferredLanguages.first ?? "en"
           if preferredLanguage.starts(with: "it") {
               return "it"
           } else if preferredLanguage.starts(with: "fr") {
               return "fr"
           } else if preferredLanguage.starts(with: "es") {
               return "es-419"
           }
           return "en"
       }
    
    private let instructionsByLanguage: [String: [Instruction]] = [
        "en": [
            Instruction(id: 1, handsposition: handposition(left: .lefthand, right: .righthand), text: "Let’s begin together, taking a moment to listen. Make sure your body feels comfortable and ready to follow the movement.", duration: 5.5, scale: 1.0, offset: .zero),
            Instruction(id: 2, handsposition: handposition(left: .lefthand, right: .righthand), text: "Try to follow my gestures, but remember you can go at your own pace. There’s no rush.", duration: 7, scale: 1.0, offset: .zero),
             Instruction(id: 3, handsposition: handposition(left: .rightcheek, right: .righthand), text: "Start by gently bringing your left hand to your right cheek, as if you want to softly caress your face with your palm.", duration: 8, scale: 2.2, offset: CGSize(width: 0, height: 400)),
             Instruction(id: 4, handsposition: handposition(left: .rightcheek, right: .righthand), text: "If you’d like, you can close your eyes to focus more on the sensations your body is experiencing.", duration: 5, scale: 2.2, offset: CGSize(width: 0, height: 400)),
             Instruction(id: 5, handsposition: handposition(left: .rightcheek, right: .righthand), text: "Stay with the sensation of contact with your hand, without rushing. Simply notice how it makes you feel.", duration: 8, scale: 2.2, offset: CGSize(width: 0, height: 400)),
            Instruction(id: 6, handsposition: handposition(left: .rightShoulder, right: .righthand), text: "Now, slowly move your left hand to your right shoulder, as if you want to cradle yourself gently with the touch.", duration: 8.5, scale: 2, offset: CGSize(width: -150, height: 300)),
             Instruction(id: 7, handsposition: handposition(left: .rightShoulder, right: .leftShoulder), text: "Move your right hand and place it gently on your left shoulder, so that both shoulders are supported by your hands.", duration: 7, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 8, handsposition: handposition(left: .rightShoulder, right: .leftShoulder), text: "How does this sensation feel? Stay for a moment and experience it.", duration: 4.5, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            
            Instruction(id: 9, handsposition: handposition(left: .rightarm, right: .leftarm), text: "Now slowly move your hands down to your biceps, letting your right and left hands slide down your arms, at your own pace.", duration: 10.5, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            
             Instruction(id: 10, handsposition: handposition(left: .rightarm, right: .leftarm), text: "Take a moment to feel your two hands moving together, as if they are gentle hands offering warmth and care.", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 11, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Calmly, move both hands toward your elbows.", duration: 3.8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 12, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "If you’d like, you can gently move your thumbs, exploring the sensation of contact.", duration: 5.3, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 13, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "This position is very practical, and you can use it whenever you want, anywhere, to feel supported.", duration: 6.5, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 14, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Give yourself a little squeeze, as if you’re offering yourself a gentle hug with love.", duration: 5, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 15, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "What do you feel when you support yourself gently, just like a kind friend would?", duration: 4.3, scale: 1.3, offset: CGSize(width: 0, height: 10)),
             Instruction(id: 16, handsposition: handposition(left: .lefthand, right: .righthand), text: "Now, slowly move both hands down your arms, bringing them together as if you want to unite the hearts of your hands.", duration: 8, scale: 1.0, offset: .zero),
            Instruction(id: 17, handsposition: handposition(left: .lefthand, right: .righthand), text: "Make soft movements, as if you’re gently caressing yourself with tenderness.", duration: 5.5, scale: 1.1, offset: .zero),
             Instruction(id: 18, handsposition: handposition(left: .heart, right: .stomach), text: "Now, move your left hand over your heart and your right hand over your stomach, as if appreciating these two important spaces of your body.", duration: 11, scale: 1.5, offset: CGSize(width: 0, height: 15)),
            Instruction(id: 19, handsposition: handposition(left: .heart, right: .stomach), text: "Bring your attention to the heartbeat, letting your breath guide you.", duration: 3.6, scale: 1.5, offset: CGSize(width: 0, height: 150)),
            Instruction(id: 20, handsposition: handposition(left: .heart, right: .stomach), text: "What happens in your body and mind when you offer yourself a gentle touch, just like you would for a friend?", duration: 7, scale: 1.5, offset: CGSize(width: 0, height: 150)),
             Instruction(id: 21, handsposition: handposition(left: .lefthand, right: .righthand), text: "I now invite you to try on your own, exploring the movement and feeling what helps you feel better.", duration: 6, scale: 1.0, offset: CGSize(width: 0, height: 0)),
            Instruction(id: 22, handsposition: handposition(left: .lefthand, right: .righthand), text: "Use the position that makes you feel calmer and more serene, letting go of everything else.", duration: 4.7, scale: 1.0, offset: .zero),
             Instruction(id: 23, handsposition: handposition(left: .lefthand, right: .righthand), text: "Listen to what your body is telling you, trusting its wisdom.", duration: 20, scale: 1.0, offset: CGSize(width: 0, height: 0))
         ],
        "it": [Instruction(id: 1, handsposition: handposition(left: .lefthand, right: .righthand), text: "Iniziamo insieme, prendendo un momento per ascoltare. Fai in modo che il tuo corpo si senta comodo e preparato a seguire il movimento.", duration: 4.5, scale: 1.0, offset: .zero),
               Instruction(id: 2, handsposition: handposition(left: .lefthand, right: .righthand), text: "Prova a seguire i miei gesti, ma ricorda che puoi andare al tuo ritmo. Non c’è fretta.", duration: 5.5, scale: 1.0, offset: .zero),
               Instruction(id: 3, handsposition: handposition(left: .rightcheek, right: .righthand), text: "Inizia portando la tua mano sinistra delicatamente verso la tua guancia destra, come se volessi accarezzare dolcemente il tuo viso con il palmo.", duration: 7.5, scale: 2.2, offset: CGSize(width: 0, height: 400)),
               Instruction(id: 4, handsposition: handposition(left: .rightcheek, right: .righthand), text: "Se ti fa piacere, puoi chiudere gli occhi per concentrarti di più sulle sensazioni che il tuo corpo sta vivendo.", duration: 5.4, scale: 2.2, offset: CGSize(width: 0, height: 400)),
               Instruction(id: 5, handsposition: handposition(left: .rightcheek, right: .righthand), text: "Rimani a sentire la sensazione di contatto con la mano, senza fretta. Semplicemente nota come ti fa sentire.", duration: 8.8, scale: 2.2, offset: CGSize(width: 0, height: 400)),
                Instruction(id: 6, handsposition: handposition(left: .rightShoulder, right: .righthand), text: "Ora, porta lentamente la mano sinistra sulla spalla destra, come se volessi cullarti delicatamente con il tocco.", duration: 6, scale: 2, offset: CGSize(width: -150, height: 300)),
               Instruction(id: 7, handsposition: handposition(left: .rightShoulder, right: .leftShoulder), text: "Muovi la mano destra e appoggiala con dolcezza sulla tua spalla sinistra, così da sentire entrambe le spalle supportate dalle mani.", duration: 7.4, scale: 1.3, offset: CGSize(width: 0, height: 10)),
               Instruction(id: 8, handsposition: handposition(left: .rightShoulder, right: .leftShoulder), text: "Come ti sembra questa sensazione? Resta un momento a percepirla.", duration: 4.6, scale: 1.3, offset: CGSize(width: 0, height: 10)),
               Instruction(id: 9, handsposition: handposition(left: .rightarm, right: .leftarm), text: "Inizia ora a spostare lentamente le mani verso i tuoi bicipiti, facendo scivolare la mano destra e la mano sinistra lungo le braccia, senza fretta.", duration: 8.5, scale: 1.3, offset: CGSize(width: 0, height: 10)),
               Instruction(id: 10, handsposition: handposition(left: .rightarm, right: .leftarm), text: "Prenditi un momento per sentire le tue due mani che si muovono insieme, come se fossero mani gentili che ti offrono calore e cura.", duration: 7.1, scale: 1.3, offset: CGSize(width: 0, height: 10)),
               Instruction(id: 11, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Con calma, muovi entrambe le mani verso i gomiti.", duration: 2.6, scale: 1.3, offset: CGSize(width: 0, height: 10)),
               Instruction(id: 12, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Se vuoi, puoi far scivolare lentamente i pollici, esplorando questa sensazione di contatto.", duration: 4.5, scale: 1.3, offset: CGSize(width: 0, height: 10)),
               Instruction(id: 13, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Questa posizione è molto pratica e puoi usarla quando vuoi, ovunque ti trovi, per sentirti supportato.", duration: 4.9, scale: 1.3, offset: CGSize(width: 0, height: 10)),
               Instruction(id: 14, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Datti una piccola stretta, come un abbraccio gentile che ti offri con amore.", duration: 3.5, scale: 1.3, offset: CGSize(width: 0, height: 10)),
               Instruction(id: 15, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Cosa provi quando ti sostieni con gentilezza, come farebbe un amico affettuoso?", duration: 3.4, scale: 1.3, offset: CGSize(width: 0, height: 10)),
               Instruction(id: 16, handsposition: handposition(left: .lefthand, right: .righthand), text: "Ora, sposta lentamente entrambe le mani verso il basso lungo le braccia, e uniscile insieme, come se volessi unire il cuore delle tue mani.", duration: 7.15, scale: 1.0, offset: .zero),
               Instruction(id: 17, handsposition: handposition(left: .lefthand, right: .righthand), text: "Fai dei movimenti delicati, come se stessi accarezzando te stesso con dolcezza.", duration: 4.3, scale: 1.1, offset: .zero),
               Instruction(id: 18, handsposition: handposition(left: .heart, right: .stomach), text: "Ora sposta la mano sinistra sopra il tuo cuore, e la mano destra sopra la tua pancia, come a voler apprezzare questi due spazi importanti del tuo corpo.", duration: 8.3, scale: 1.5, offset: CGSize(width: 0, height: 15)),
               Instruction(id: 19, handsposition: handposition(left: .heart, right: .stomach), text: "Porta la tua attenzione sul battito del cuore, lasciando che il respiro ti accompagni.", duration: 4.6, scale: 1.5, offset: CGSize(width: 0, height: 150)),
               Instruction(id: 20, handsposition: handposition(left: .heart, right: .stomach), text: "Cosa succede nel tuo corpo, nella tua mente, quando offri a te stesso un tocco gentile, proprio come faresti per un amico?", duration: 8.1, scale: 1.5, offset: CGSize(width: 0, height: 150)),
               Instruction(id: 21, handsposition: handposition(left: .lefthand, right: .righthand), text: "Ti invito ora a provare da solo, esplorando il movimento e sentendo cosa ti fa star meglio.", duration: 6.5, scale: 1.0, offset: .zero),
               Instruction(id: 22, handsposition: handposition(left: .lefthand, right: .righthand), text: "Usa la posizione che ti fa sentire più calmo e sereno, lasciando andare tutto il resto.", duration: 5, scale: 1.0, offset: .zero),
               Instruction(id: 23, handsposition: handposition(left: .lefthand, right: .righthand), text: "Ascolta cosa il tuo corpo ti sta dicendo, fidandoti della sua saggezza.", duration: 5.5, scale: 1.0, offset: .zero)
            ],
        "fr": [
            Instruction(id: 1, handsposition: handposition(left: .lefthand, right: .righthand), text: "Commençons ensemble, en prenant un instant pour écouter. Assure-toi que ton corps se sente à l’aise et prêt à suivre le mouvement, sans effort.", duration: 12, scale: 1.0, offset: .zero),
            Instruction(id: 2, handsposition: handposition(left: .lefthand, right: .righthand), text: "Tu peux suivre mes gestes si tu le souhaites, mais souviens-toi que tu peux toujours aller à ton propre rythme. Il n’y a aucune précipitation, prends le temps dont tu as besoin.", duration: 13, scale: 1.0, offset: .zero),
            Instruction(id: 3, handsposition: handposition(left: .rightcheek, right: .righthand), text: "Commence en amenant doucement ta main gauche sur ta joue droite, comme si tu caressais délicatement ton visage avec la paume de ta main.", duration: 10, scale: 2.2, offset: CGSize(width: 0, height: 400)),
            Instruction(id: 4, handsposition: handposition(left: .rightcheek, right: .righthand), text: "Si tu en as envie, tu peux fermer les yeux pour te concentrer pleinement sur les sensations qui émergent.", duration: 8, scale: 2.2, offset: CGSize(width: 0, height: 400)),
            Instruction(id: 5, handsposition: handposition(left: .rightcheek, right: .righthand), text: "Reste avec cette sensation de contact, sans te presser. Observe simplement comment cela te fait te sentir, sans chercher à changer quoi que ce soit.", duration: 11, scale: 2.2, offset: CGSize(width: 0, height: 400)),
            Instruction(id: 6, handsposition: handposition(left: .rightShoulder, right: .righthand), text: "Quand tu es prêt(e), déplace lentement ta main gauche vers ton épaule droite, comme si tu te berçais avec douceur, dans un geste réconfortant.", duration: 12, scale: 2, offset: CGSize(width: -150, height: 300)),
            Instruction(id: 7, handsposition: handposition(left: .rightShoulder, right: .leftShoulder), text: "Puis, amène ta main droite sur ton épaule gauche, offrant à tes deux épaules un soutien tendre et bienveillant.", duration: 10, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 8, handsposition: handposition(left: .rightShoulder, right: .leftShoulder), text: "Comment te sens-tu avec cette sensation ? Prends le temps de rester dans cette posture, d’accueillir ce qui se présente.", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 9, handsposition: handposition(left: .rightarm, right: .leftarm), text: "Lorsque tu es prêt(e), fais glisser lentement tes mains vers tes biceps, en laissant chaque mouvement être porté par la douceur et l’attention.", duration: 13, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 10, handsposition: handposition(left: .rightarm, right: .leftarm), text: "Prends un moment pour ressentir la manière dont tes deux mains se déplacent ensemble, comme si elles offraient chaleur et soin, avec toute leur bienveillance.", duration: 11, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 11, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Calmement, descends encore tes mains vers tes coudes. Si tu le souhaites, tu peux bouger doucement tes pouces, explorant la sensation de ce contact, en toute curiosité.", duration: 12, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 12, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Cette posture est précieuse : tu peux l’adopter à tout moment, où que tu sois, pour retrouver un sentiment de soutien et de sécurité.", duration: 12, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 13, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Accorde-toi un petit serrage, comme si tu t’offrais un câlin doux et réconfortant.", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 14, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Que ressens-tu lorsque tu te soutiens ainsi, avec la tendresse d’un(e) ami(e) bienveillant(e) ?", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 15, handsposition: handposition(left: .lefthand, right: .righthand), text: "Quand tu es prêt(e), fais glisser lentement tes mains le long de tes bras, en les rapprochant doucement, comme si tu cherchais à unir les cœurs de tes mains.", duration: 11, scale: 1.0, offset: .zero),
            Instruction(id: 16, handsposition: handposition(left: .lefthand, right: .righthand), text: "Accompagne chaque mouvement de douceur, comme si tu te caressais avec la plus grande tendresse.", duration: 10, scale: 1.1, offset: .zero),
            Instruction(id: 17, handsposition: handposition(left: .heart, right: .stomach), text: "Place maintenant ta main gauche sur ton cœur et ta main droite sur ton ventre, reconnaissant ces deux espaces essentiels de ton corps.", duration: 10, scale: 1.5, offset: CGSize(width: 0, height: 15)),
            Instruction(id: 18, handsposition: handposition(left: .heart, right: .stomach), text: "Ramène ton attention sur le battement de ton cœur, et laisse ta respiration te guider, naturellement.", duration: 11, scale: 1.5, offset: CGSize(width: 0, height: 150)),
            Instruction(id: 19, handsposition: handposition(left: .heart, right: .stomach), text: "Observe ce qui se passe en toi lorsque tu t’offres ce toucher doux, comme tu le ferais pour quelqu’un que tu aimes.", duration: 10, scale: 1.5, offset: CGSize(width: 0, height: 150)),
            Instruction(id: 20, handsposition: handposition(left: .lefthand, right: .righthand), text: "Je t’invite maintenant à explorer ces gestes par toi-même, en découvrant ce qui t’apporte le plus de calme et de réconfort.", duration: 9, scale: 1.0, offset: .zero),
            Instruction(id: 21, handsposition: handposition(left: .lefthand, right: .righthand), text: "Choisis la posture qui te fait te sentir le plus serein(e), et laisse tout le reste s’éloigner doucement.", duration: 10, scale: 1.0, offset: .zero),
            Instruction(id: 22, handsposition: handposition(left: .lefthand, right: .righthand), text: "Écoute ce que ton corps te murmure, et fais-lui confiance : il possède sa propre sagesse.", duration: 10, scale: 1.0, offset: .zero)
        ],
        "es-419": [
            Instruction(id: 1, handsposition: handposition(left: .lefthand, right: .righthand), text: "Comencemos juntos, tomando un momento para escuchar. Asegúrate de que tu cuerpo se sienta cómodo y listo para seguir el movimiento.", duration: 10, scale: 1.0, offset: .zero),
            Instruction(id: 2, handsposition: handposition(left: .lefthand, right: .righthand), text: "Intenta seguir mis gestos, pero recuerda que puedes ir a tu propio ritmo. No hay prisa.", duration: 9, scale: 1.0, offset: .zero),
            Instruction(id: 3, handsposition: handposition(left: .rightcheek, right: .righthand), text: "Comienza llevando suavemente tu mano izquierda a tu mejilla derecha, como si quisieras acariciar suavemente tu rostro con la palma de tu mano.", duration: 13, scale: 2.2, offset: CGSize(width: 0, height: 400)),
            Instruction(id: 4, handsposition: handposition(left: .rightcheek, right: .righthand), text: "Si lo deseas, puedes cerrar los ojos para concentrarte más en las sensaciones que tu cuerpo está experimentando.", duration: 10, scale: 2.2, offset: CGSize(width: 0, height: 400)),
            Instruction(id: 5, handsposition: handposition(left: .rightcheek, right: .righthand), text: "Quédate con la sensación de contacto con tu mano, sin prisa. Simplemente observa cómo te hace sentir.", duration: 10, scale: 2.2, offset: CGSize(width: 0, height: 400)),
            Instruction(id: 6, handsposition: handposition(left: .rightShoulder, right: .righthand), text: "Ahora, mueve lentamente tu mano izquierda hacia tu hombro derecho, como si quisieras acunarte suavemente con el toque.", duration: 10, scale: 2, offset: CGSize(width: -150, height: 300)),
            Instruction(id: 7, handsposition: handposition(left: .rightShoulder, right: .leftShoulder), text: "Mueve tu mano derecha y colócala suavemente sobre tu hombro izquierdo, para que ambos hombros estén apoyados por tus manos.", duration: 10, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 8, handsposition: handposition(left: .rightShoulder, right: .leftShoulder), text: "¿Cómo se siente esta sensación? Quédate un momento y vívela.", duration: 7, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 9, handsposition: handposition(left: .rightarm, right: .leftarm), text: "Ahora mueve lentamente tus manos hacia abajo, hasta tus bíceps, dejando que tus manos derecha e izquierda deslicen por tus brazos, a tu propio ritmo.", duration: 12, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 10, handsposition: handposition(left: .rightarm, right: .leftarm), text: "Tómate un momento para sentir cómo se mueven juntas tus dos manos, como si fueran manos suaves que ofrecen calor y cuidado.", duration: 10, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 11, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Con calma, mueve ambas manos hacia tus codos.", duration: 7, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 12, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Si lo deseas, puedes mover suavemente tus pulgares, explorando la sensación de contacto.", duration: 10, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 13, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Esta posición es muy práctica, y puedes usarla siempre que quieras, en cualquier lugar, para sentirte apoyado.", duration: 10, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 14, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Dáte un pequeño apretón, como si te estuvieras ofreciendo un abrazo suave con amor.", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 15, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "¿Qué sientes cuando te apoyas suavemente, como lo haría un amigo amable?", duration: 7, scale: 1.3, offset: CGSize(width: 0, height: 10)),
            Instruction(id: 16, handsposition: handposition(left: .lefthand, right: .righthand), text: "Ahora, mueve lentamente ambas manos hacia abajo por tus brazos, juntándolas como si quisieras unir los corazones de tus manos.", duration: 10, scale: 1.0, offset: .zero),
            Instruction(id: 17, handsposition: handposition(left: .lefthand, right: .righthand), text: "Haz movimientos suaves, como si te estuvieras acariciando con ternura.", duration: 7, scale: 1.1, offset: .zero),
            Instruction(id: 18, handsposition: handposition(left: .heart, right: .stomach), text: "Ahora, mueve tu mano izquierda sobre tu corazón y tu mano derecha sobre tu estómago, como si estuvieras apreciando estos dos espacios importantes de tu cuerpo.", duration: 13, scale: 1.5, offset: CGSize(width: 0, height: 15)),
            Instruction(id: 19, handsposition: handposition(left: .heart, right: .stomach), text: "Lleva tu atención al latido de tu corazón, dejando que tu respiración te guíe.", duration: 7, scale: 1.5, offset: CGSize(width: 0, height: 150)),
            Instruction(id: 20, handsposition: handposition(left: .heart, right: .stomach), text: "¿Qué sucede en tu cuerpo y mente cuando te ofreces un toque suave, como lo harías con un amigo?", duration: 9, scale: 1.5, offset: CGSize(width: 0, height: 150)),
            Instruction(id: 21, handsposition: handposition(left: .lefthand, right: .righthand), text: "Ahora te invito a intentarlo por ti mismo, explorando el movimiento y sintiendo lo que te ayuda a sentirte mejor.", duration: 10, scale: 1.0, offset: .zero),
            Instruction(id: 22, handsposition: handposition(left: .lefthand, right: .righthand), text: "Usa la posición que te haga sentir más tranquilo y sereno, dejando ir todo lo demás.", duration: 8, scale: 1.0, offset: .zero),
            Instruction(id: 23, handsposition: handposition(left: .lefthand, right: .righthand), text: "Escucha lo que tu cuerpo te está diciendo, confiando en su sabiduría.", duration: 10, scale: 1.0, offset: .zero)
        ]
    ]
    
    var instructions: [Instruction] {
        return instructionsByLanguage[getCurrentLanguage(), default: instructionsByLanguage["en"]!]
    }
}


#Preview {
    GlowingBodyContainerView()
}
