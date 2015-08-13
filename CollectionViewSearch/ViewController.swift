import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UISearchResultsUpdating
{
    let data = "Underusher blindstory twopenny nonserviceability crocodilian superdesirous cohabitant nonrelation drest proexperiment rocketer uncatechized ungesturing zadkine. Hanotaux floweret hypocotylous leno seversky porphyrizing desilverized predetection seiner overblanch adoptable coastguardsman randy gummas. Eventfully halleck ironmongeries presurmising dockmackie wringing unreflective unchauvinistic holdable unscarce trunkfishes hermetic niersteiner favonian. Transvaluing haematozoal tribe polysyllabic bimodule highbred rakishness shcheglovsk reinspired inexpensively polysyllogism acrocephalic cete priapus. Sicklemic tup ramillies aphorised clatter efficaciously unscintillant heracliteanism wirephotoed prig overmerit prosopopoeia limy unsupplicating. Uneclipsed restricken seler gnashingly nkgb sclerenchymatous delos lenticular lindsey panpsychic cyesis nitti protolanguage xavier cinnabarine gradable metamere beano conchate undivulged rescission bloodletter exorcized insured formicate outplod rect praiseworthiness bitchiest. Convincing unrouged conversably hic dependently oval reverend rebel reassimilation disrespect tachylite nonobjection hierologic unscabrous nonprotrusive mace sparse supplemental hungry misvalued flopper overquiet vying bluely spiral ruc complying neut cheeky. Outsummed canarian multimotor crooner prerecognition jacalinne unjilted exteriorising municipalization complicity ordzhonikidze vodka ratlike fossette spinigerous vivaciousness unlubricant spartanburg chortle tearingly unpalatial antiserum crwth bituminoid sybaritical mesial catchfly countryfiedness toxoid. Nonelect centerable unrude algona enos specified synapse warison mentally unmarried stabiliser seleucia sensualistic wapatoo embracing adrenaline uncomplementary interconfessional divinise bestial predisplacing seljukian equilibrated roan sora distinctionless vitriolic refrigerating geometer. Belafonte crime insensibility martyry penetralian westnorthwestwardly phenanthrene shoeing hyperopia arise ligneous unextractable reevacuating diluted chivies mahala eyeleted kerneling ziwiye subdemonstrate lubberly missteer spikefish donated decomposer stunningly beyond mongrelism. Mastigophora auric uninsultable turbinal normal dithionite coleopteran aaronitic unmournful noncomprehending mingrel dialogue dashboard ladler refresher saleroom dubrovnik constellated reinter unsubmerging alagez peninsula litany matricide disfigured prochoos muttra denominationalist dimissorial. Communistically brale atomics lotion irwin bandspreading recalesce bioelectrogenesis ambidextral sequacious decem crabbed scandalise surfeit heliades layton fawnia overspacious nonprocessional adman chymotrypsinogen derisible nonscheduled jokeless othniel unforbidden spherometer cottonpickin'' peradventure. Ambulate acidimeter joyfulness hanker spermatophyte tubercularly terminus cwt unthriving noncultivatable sonnetising subdeputy sunberry amateurism doxologically pushrod colorature wanion circuitousness supergravitating waterishly clubbing unwiped overvalue undetained wafter bless def diplodocus. Unreproved guaranteed characteristically pretravelled loring jaspered facture juristic misstyled mishap unexemplary masqueraded newcomer fixedness nonvisional choom inexpiate preallowance stresemann nonconversant figurative unpervading wickliffe backstay genealogically carrack semirationalized manteau deadlight. Cellaret repelled roam taperer genus podsol patriarchically adulterer cattleman contradictory beastings pavane unelevated eczematous malebranche northampton superevangelical shopper parang nonabrasive leavis codicillary eudaemonism panfried odinism rase spinproof lifeless sogat. Aquarist faceting interpollinate unfavoured spiritedly nontesting terribilitï¾¡ skylined puissance tolstoyism berenice amnestic thornless cyclotomy mehitzoth aureus jan provoking aegaeon mede eligibly constructible malting nonevangelic biosynthesis interfilamentous peristome seram preboil. Alexandropolis gibbons tropicalize retinge homicidally hospitalized hindoo postglacial facing subducing swollenly impulsively alchemist hodges hypercathartic reinjure reviewless nonviolence reveille aleut misdid pyridoxal farfetchedness seminomas cdn chatteringly verset tavr nursemaid. Unferried rdhos tesselate primp ruthfully maternalistic nongeologic dissipator alphanumeric unimpugnable scabble mohalim nazirite infective rateuses challah exhibitionistic conglutinate railroading slim unstabled evelynne estheticism dead scalado propelling augmentative philonome devoiced. Malie interaxial heptameter herl deferent culion subsaline perinephria pseudodiphtheric goofy ostende concussive sparing platykurtosis obumbrating dorchester angiospermous uncontaminative dyspnoic lonesomeness suppositionless heelplate alclad slough ideograph poolroom eastland cognac androconia. Sculker outproducing oeneus slowdown fungicide deducing nonaristocratical contaminated interpolate visayan unconcurring moitier aurae cleft journalize aggravatingly heathenizing siey solim zebrass rheydt sublunary metathethoraxes ahorse tampur barefoot putrescine unchary unconserving. Intermobility unwhetted qadiriya fetichistic suited magnum hybridized proempiricism pinpoint str cognitional praenominal preconcur wheezer telemachus uncovetous numbly pigling trivialised denaturised innovate grabbing sampling cortona irreducibility duvetine compote metaphorically clericals."
        .componentsSeparatedByString(" ")
    var filteredData = [String]()

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var searchBarContainerView: UIView!

    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self

        searchController.hidesNavigationBarDuringPresentation = true
        searchController.dimsBackgroundDuringPresentation = false
        
        return searchController
    }()

    override func viewDidLoad()
    {
        super.viewDidLoad()

        searchController.searchBar.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        searchBarContainerView.addSubview(searchController.searchBar)
        searchController.searchBar.sizeToFit()
    }
    
    //MARK: UISearchResultsUpdating
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        filterData()
        collectionView?.reloadData()
    }
    
    func filterData()
    {
        filteredData = data.filter({ (string) -> Bool in
            if let searchTerm = self.searchController.searchBar.text {
                let searchTermMatches = self.searchString(string, searchTerm: searchTerm).count > 0
                if searchTermMatches {
                    return true
                }
            }
            return false
        })
    }
    
    func searchString(string: String, searchTerm:String) -> Array<AnyObject>
    {
        var matches:Array<AnyObject> = []
        do {
            let regex = try NSRegularExpression(pattern: searchTerm, options: [.CaseInsensitive, .AllowCommentsAndWhitespace])
            let range = NSMakeRange(0, string.characters.count)
            matches = regex.matchesInString(string, options: [], range: range)
        } catch _ {
        }
        return matches
    }
    
    //MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if searchController.active {
            return filteredData.count
        } else {
            return data.count
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        var cell = LabelCollectionViewCell()
        
        if let labelCell = collectionView.dequeueReusableCellWithReuseIdentifier("LabelCell", forIndexPath: indexPath) as? LabelCollectionViewCell {
            if searchController.active {
                if let searchTerm = self.searchController.searchBar.text {
                    let labelText = filteredData[indexPath.row] as String
                    let searchTermMatches = self.searchString(labelText, searchTerm: searchTerm)
                    let attributedLabelText = NSMutableAttributedString(string: labelText)
                    for match in searchTermMatches as! [NSTextCheckingResult] {
                        let matchRange = match.range
                        attributedLabelText.addAttribute(NSBackgroundColorAttributeName, value: UIColor.yellowColor(), range: matchRange)
                    }
                    labelCell.label?.attributedText = attributedLabelText
                }
            } else {
                let labelText = data[indexPath.row] as String
                labelCell.label?.attributedText = nil
                labelCell.label?.text = labelText
            }
            cell = labelCell
        }
        
        return cell
    }
}

