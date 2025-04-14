import SwiftUI

struct JournalEntreyDetailView: View {

    let detailJournalEntry: JournalEntry

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(detailJournalEntry.date, style: .date)
                        .bold()
                    Text("-")
                    Text(
                        String(
                            repeating: "⭐️",
                            count: Int(detailJournalEntry.rating)
                        )
                    )
                    Spacer()
                }
                .padding(.bottom, 5)
                Text(detailJournalEntry.text)
            }
            .padding()
        }
        .navigationTitle(detailJournalEntry.title)

    }
}

#Preview {
    NavigationStack {
        JournalEntreyDetailView(
            detailJournalEntry: JournalEntry(
                title: "A good day",
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque semper consectetur libero. Etiam fermentum neque ac neque condimentum, id finibus elit consequat.\nMauris pharetra dapibus mi, ut pulvinar sem cursus eu. Curabitur eleifend nisl vitae risus sodales efficitur. Integer interdum ultricies diam, eget sollicitudin nibh lacinia vel. Sed vel sagittis ipsum, nec sodales odio. Donec pellentesque turpis vitae libero hendrerit maximus. Quisque ornare sollicitudin velit, in tempor quam rutrum ut. Aliquam sed imperdiet nunc, quis porttitor lacus.\n\nPhasellus scelerisque felis orci, non ultrices urna blandit facilisis. Ut nunc dolor, malesuada sit amet ultricies at, ornare ut tortor. Quisque iaculis nec ante ut lacinia. Morbi sit amet vehicula felis. Aliquam sodales interdum dui ac mollis. Nulla a maximus libero, at lacinia turpis. Suspendisse potenti. Etiam vitae diam interdum, elementum urna ut, tincidunt lectus. Vestibulum nulla orci, viverra ut arcu at, varius faucibus justo. Mauris gravida sem ante, pharetra dignissim urna dapibus nec. Aenean pretium venenatis dui vel consectetur. Nam consequat ante vitae nulla lacinia, eu ullamcorper sapien pharetra. Etiam sagittis nunc et dolor pellentesque semper. Nunc nec orci fringilla, mollis est nec, sodales arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce faucibus sagittis est, et eleifend arcu pulvinar ac. Aenean facilisis metus tortor, a porttitor augue pretium ut. Pellentesque lorem massa, dapibus vel ullamcorper a, egestas id nulla. Quisque ut nisl dapibus lectus bibendum malesuada et at mi. Donec porttitor sodales libero, eu vulputate est. Morbi faucibus urna risus, non euismod purus ornare a. Proin sit amet dui vehicula felis faucibus fringilla at ut ligula. Praesent elementum lectus quis risus semper, et sodales turpis ultrices. Vivamus et elementum metus. Nullam nec commodo ligula. Ut mattis vehicula placerat. Morbi convallis mattis leo sed ullamcorper. Morbi condimentum lorem aliquam magna ultrices luctus a sit amet risus. Maecenas cursus sollicitudin dui eu vestibulum. Mauris tempus elit eu vulputate rutrum. Nam imperdiet quis elit non vulputate. Nulla facilisi. Praesent congue libero eget diam vulputate, non efficitur est laoreet.Suspendisse potenti. Sed vel urna sagittis, tempus justo eget, ullamcorper elit. Praesent blandit ut ante vitae luctus. Curabitur egestas lectus non elit dictum, a tristique metus interdum. Vivamus et nisl elementum, imperdiet justo eu, ornare tellus. Proin cursus rhoncus quam, et fermentum arcu porta porta. In massa ligula, posuere vel arcu at, sodales pellentesque arcu. Suspendisse id dolor sapien. Aenean eu erat id neque mattis sollicitudin at non felis. Sed nunc orci, blandit quis eros id, lacinia interdum nunc. Nam eu magna vel sem hendrerit gravida eget nec nibh. Sed eleifend tortor vitae lectus molestie aliquam. Donec quis diam dictum velit porttitor consequat in ac mauris. Donec aliquet, augue eget fermentum consequat, nisi orci feugiat felis, ut laoreet metus massa a eros.",
                rating: 4,
                date: Date()
            )
        )
    }
}
